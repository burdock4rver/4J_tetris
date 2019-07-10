class Display { //<>// //<>//

  int stageSize_x=10;  // 横ブロック数(ゲーム幅) //*
  int stageSize_y=19;  // 縦ブロック数(ゲーム高さ) //*
  float blockSize=30;  // ブロックの大きさ
  float stagePosition_x = (241)/2;  //プレイ画面の位置
  float stagePosition_y = 503 / 2;
  int sSarray_x;       // 横配列
  int sSarray_y;       // 縦配列
  float nextMinoX = 430; //次のブロックの表示するX座標
  float nextMinoY = 140; //次のブロックの表示するY座標
  float nextPointInreval = 50; //次のブロックの表示位置の差
  float nextMinoSize = blockSize-10;
  float holdMinoX=15;
  float holdMinoY=180;
  float holdMinoSize=blockSize-10;
  float arst_y;
  PImage ui_img;       // 画面背景
  PImage minoTex[];    // ステージに設置されたミノ描画用のテクスチャ

  Mino dispNextMino[];
  Mino holdMino;
  Mino minos[];

  public Display(Stage stage) {    
    ui_img = loadImage("resources/TEST.png");
    minoTex = new PImage[7];
    minoTex[0] = loadImage("resources/minoTfront.png");
    minoTex[1] = loadImage("resources/minoIfront.png");
    minoTex[2] = loadImage("resources/minoJfront.png");
    minoTex[3] = loadImage("resources/minoLfront.png");
    minoTex[4] = loadImage("resources/minoSfront.png");
    minoTex[5] = loadImage("resources/minoZfront.png");
    minoTex[6] = loadImage("resources/minoOfront.png");
    
    minos = new Mino[7];
    minos[0] = new TMino(0,0);
    minos[1] = new IMino(0,0);
    minos[2] = new JMino(0,0);
    minos[3] = new LMino(0,0);
    minos[4] = new SMino(0,0);
    minos[5] = new ZMino(0,0);
    minos[6] = new OMino(0,0);

    sSarray_x = stage.stage[0].length;    //横配列
    sSarray_y = stage.stage.length;  //縦配列

    arst_y = sSarray_y-stageSize_y-1;   //配列とブロック数の差
    dispNextMino =new Mino[4];
  }

  public void update() {
    stage.getNext(dispNextMino);
    holdMino = stage.getHoldMino(holdMino);
  }

  public void showGhost() {
  }

  public void showText() {
  }

  public void showNext() {
    translate(nextMinoX, nextMinoY);
    for (int next = 0; next < 4; next++) {
      translate(0, nextPointInreval);
      if (next == 1) {
        nextMinoSize-=5;       //2個前のブロックを小さく
      }
      for (int i = 0; i < 5; i++) {
        for (int j = 0; j < 5; j++) {
          if (dispNextMino[next].shape[i][j] >= 1) {
            image(minoTex[dispNextMino[next].id - 1], nextMinoSize* j, nextMinoSize * i, nextMinoSize, nextMinoSize);
          }
        }
      }
    }
    //元に戻す
    nextMinoSize +=5;
    translate(-nextMinoX, -nextMinoY+nextPointInreval*(-4));
  }

  public void showHold() {
    if (holdMino != null) {
      translate(holdMinoX, holdMinoY);
      for (int i = 0; i < 5; i++) {
        for (int j = 0; j < 5; j++) {
          if (minos[holdMino.id - 1].shape[i][j] >= 1) {
            image(minoTex[minos[holdMino.id - 1].id - 1], holdMinoSize* j, holdMinoSize * i, holdMinoSize, holdMinoSize);
          }
        }
      }
      //元に戻す
      translate(-holdMinoX, -holdMinoY);
    }
  }

  public void drawBackground() {  //背景を含むゲーム全体画面
    image(ui_img, 0, 0, width, height);
  }

  // ステージに設置されているブロックを描画
  public void drawgame(Stage stage) {  //ゲームプレイ画面
    for (int i = (int)arst_y; i < sSarray_y; i++) {
      for (int j = 0; j < sSarray_x; j++) {

        if (stage.stage[i][j] == 0) {
          fill(255);
          stroke(0);
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
          if (mino.posy < mino.ghost_y) {
            fill(210, 200);
            noStroke();
            rect(stagePosition_x + blockSize * (x + mino.posx - 1), stagePosition_y + blockSize * (y + mino.ghost_y - arst_y), blockSize, blockSize);
          }
          // ミノの本体
          image(mino.texture, stagePosition_x + blockSize * (x + mino.posx - 1), stagePosition_y + blockSize * (y + mino.posy - arst_y), blockSize, blockSize);
        }
      }
    }
  }
}
