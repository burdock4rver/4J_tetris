class Display {

  private Mino mino;
  int i, j;
  int stageSize_x=10;  //横ブロック数(ゲーム幅) //*
  int stageSize_y=19;  //縦ブロック数(ゲーム高さ) //*
  float blockSize=35;  //ブロックの大きさ
  float stagePosition_x=(180)/2;  //プレイ画面の位置
  float stagePosition_y=(1920-1530)/2;
  int sSarray_x;    //横配列
  int sSarray_y;    //縦配列
  float arst_y;
  PImage ui_img;  //画面背景
  Stage stage1;
  Mino minos[];

  public Display() {    
    ui_img = loadImage("resources/main_ui.png");
    stage1 = new Stage();
    minos = new Mino[7];
    minos[0] = new TMino();
    minos[1] = new IMino();
    minos[2] = new JMino();
    minos[3] = new LMino();
    minos[4] = new SMino();
    minos[5] = new ZMino();
    minos[6] = new OMino();
    sSarray_x = stage1.stage[0].length;    //横配列
    sSarray_y = stage1.stage.length;  //縦配列
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


  public void drawgame() {  //ゲームプレイ画面

    for (i = (int)arst_y; i < sSarray_y; i++) {
      for (j = 0; j < sSarray_x; j++) {

        if (stage1.stage[i][j] == 0) {
          rect(stagePosition_x-blockSize+blockSize*j, stagePosition_y+blockSize*(i-arst_y), blockSize, blockSize);
        } else if (stage1.stage[i][j] > 0) {
          image(minos[stage1.stage[i][j] - 1].texture, stagePosition_x + blockSize * (j - 1), stagePosition_y + blockSize * (i-arst_y), blockSize, blockSize);
        }
      }
    }
  }
}
