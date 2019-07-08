class Display {
  
  int stageSize_x=10;  // 横ブロック数(ゲーム幅) //*
  int stageSize_y=19;  // 縦ブロック数(ゲーム高さ) //*
  float blockSize=35;  // ブロックの大きさ
  float stagePosition_x = (180)/2;  //プレイ画面の位置
  float stagePosition_y = (1920-1530)/2;
  int sSarray_x;       // 横配列
  int sSarray_y;       // 縦配列
  float arst_y;
  PImage ui_img;       // 画面背景
  PImage minoTex[];    // ステージに設置されたミノ描画用のテクスチャ
  
  public Display(Stage stage) {    
    ui_img = loadImage("resources/main_ui.png");
    minoTex = new PImage[7];
    minoTex[0] = loadImage("resources/minoTfront.png");
    minoTex[1] = loadImage("resources/minoIfront.png");
    minoTex[2] = loadImage("resources/minoJfront.png");
    minoTex[3] = loadImage("resources/minoLfront.png");
    minoTex[4] = loadImage("resources/minoSfront.png");
    minoTex[5] = loadImage("resources/minoZfront.png");
    minoTex[6] = loadImage("resources/minoOfront.png");
    
    sSarray_x = stage.stage[0].length;    //横配列
    sSarray_y = stage.stage.length;  //縦配列
    
    arst_y = sSarray_y-stageSize_y-1;   //配列とブロック数の差
  }
  public void showGhost() {
  }

  public void showText() {
  }

  public void showNext() {
  }

  public void showHold() {
  }

  public void drawBackground() {  //背景を含むゲーム全体画面
    image(ui_img, 0, 0, width, height);
  }
  
  // ステージに設置されているブロックを描画
  public void drawgame(Stage stage) {  //ゲームプレイ画面

    for (int i = (int)arst_y; i < sSarray_y; i++) {
      for (int j = 0; j < sSarray_x; j++) {

        if (stage.stage[i][j] == 0) {
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
          image(mino.texture, stagePosition_x + blockSize * (x + mino.posx - 1), stagePosition_y + blockSize * (y + mino.posy - arst_y), blockSize, blockSize);
        }
      }
    }
  }
}
