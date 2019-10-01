class Display { //<>// //<>// //<>//

  int stageSize_x=10;  // 横ブロック数(ゲーム幅) //*
  int stageSize_y=19;  // 縦ブロック数(ゲーム高さ) //*
  float blockSize=30;  // ブロックの大きさ (変更する際はMinoclassのも変更)
  float stagePosition_x = (241)/2;  //プレイ画面の位置
  float stagePosition_y = 503 / 2;
  int sSarray_x;       // 横配列
  int sSarray_y;       // 縦配列
  float nextPointInreval = 50; //次のブロックの表示位置の差
  float arst_y;
  float collectNextX = 20;          //ネクストブロック座標補正(次のブロック以外のネクストの位置を変えるため)
  float collectNextY = 20;          
  PImage ui_img;       // 画面背景
  PImage minoTex[];    // ステージに設置されたミノ描画用のテクスチャ
  String score = String.valueOf(stage.getScore());//スコア

  Mino dispNextMino[];
  Mino holdMino;
  Mino minos[];

  public Display(Stage stage) {    
    //テクスチャ設定
    ui_img = loadImage("resources/TEST.png");
    minoTex = new PImage[7];
    
    minos = new Mino[7];
    minos[0] = new TMino(0, 0);
    minos[1] = new IMino(0, 0);
    minos[2] = new JMino(0, 0);
    minos[3] = new LMino(0, 0);
    minos[4] = new SMino(0, 0);
    minos[5] = new ZMino(0, 0);
    minos[6] = new OMino(0, 0);
    
    for(int i = 0; i < 7; i++){
      minoTex[i] = minos[i].texture;
    }

    sSarray_x = stage.stage[0].length;    //横配列
    sSarray_y = stage.stage.length;  //縦配列

    arst_y = sSarray_y-stageSize_y-1;   //配列とブロック数の差
    dispNextMino =new Mino[4];
  }

  public void update() {
    stage.getNext(dispNextMino);    
    holdMino = stage.getHoldMino(holdMino);
    score = String.valueOf(stage.score);
  }
  //ゴースト絵画
  public void showGhost(int x,int y,Mino mino) {
    if (mino.posy < mino.ghost_y) {
      fill(210, 200);
      noStroke();
      rect(stagePosition_x + blockSize * (x + mino.posx - 1), stagePosition_y + blockSize * (y + mino.ghost_y - arst_y), blockSize, blockSize);
    }
  }


  
  //ネクスト表示
  public void showNext() {
    for (int next = 0; next < 4; next++) {
      translate(0, nextPointInreval);

      translate(dispNextMino[next].nextPointX, dispNextMino[next].nextPointY);
      if (next >= 1) { //2個前
        dispNextMino[next].nextBlockSize -=5;       
        translate(collectNextX, collectNextY);
      } else {  //1個前
      }
      for (int i = 0; i < 5; i++) {
        for (int j = 0; j < 5; j++) {
          if (dispNextMino[next].shape[i][j] >= 1) {
            image(minoTex[dispNextMino[next].id - 1], dispNextMino[next].nextBlockSize* j, dispNextMino[next].nextBlockSize * i, dispNextMino[next].nextBlockSize, dispNextMino[next].nextBlockSize);
          }
        }
      }
      if (next >= 1) {
        translate(-collectNextX, -collectNextY);
        dispNextMino[next].nextBlockSize +=5;
      }

      translate(-dispNextMino[next].nextPointX, -dispNextMino[next].nextPointY);
    }
    //元に戻す

    translate(0, nextPointInreval*(-4));
  }
  
  //ホールド表示
  public void showHold() {
    if (holdMino != null) {
      translate(holdMino.holdPointX, holdMino.holdPointY);
      for (int i = 0; i < 5; i++) {
        for (int j = 0; j < 5; j++) {
          if (minos[holdMino.id - 1].shape[i][j] >= 1) {
            image(minoTex[minos[holdMino.id - 1].id - 1], holdMino.holdSize* j, holdMino.holdSize * i, holdMino.holdSize, holdMino.holdSize);
          }
        }
      }
      //元に戻す
      translate(-holdMino.holdPointX, -holdMino.holdPointY);
    }
  }

  //背景
  public void drawBackground() {  
    image(ui_img, 0, 0, width, height);
  }

  // ステージに設置されているブロックを描画
  public void drawgame(Stage stage) {  //ゲームプレイ画面
    for (int i = (int)arst_y; i < sSarray_y; i++) {
      for (int j = 0; j < sSarray_x; j++) {

        if (stage.stage[i][j] == 0) {
          fill(255);
          stroke(150);
          noFill();
          rect(stagePosition_x-blockSize+blockSize*j, stagePosition_y+blockSize*(i-arst_y), blockSize, blockSize);
        } else if (stage.stage[i][j] > 0) {
          image(minoTex[stage.stage[i][j] - 1], stagePosition_x + blockSize * (j - 1), stagePosition_y + blockSize * (i-arst_y), blockSize, blockSize);
        }
      }
    }
  }

  // 落下中のミノ描画
  public void drawFallingMino(Mino mino) {
    for (int y = 0; y < 5; y++) {
      for (int x = 0; x < 5; x++) {
        if (mino.shape[y][x] != 0) {
          // ミノの影
          showGhost(x,y,mino);
          // ミノの本体
          image(mino.texture, stagePosition_x + blockSize * (x + mino.posx - 1), stagePosition_y + blockSize * (y + mino.posy - arst_y), blockSize, blockSize);
        }
      }
    }
  }
  
  //スタート画面の表示
  public boolean startScreen(Stage stage){
    //ここにスタート画面を表示するコードを書く終了したらtrueにする
    return false;
  }
  
  //scoreを絵画
  public void drawScore(Stage stage){
    textSize(35);
    fill(0);
    text(score, 390, 117);
  }
  
    //Tetrisなどの文字を絵画
  public void showText() {
  }
}
