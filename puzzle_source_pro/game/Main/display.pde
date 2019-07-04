class Display {
  
  private Mino mino;
  int i,j;
  float blockSize=35;  //ブロックの大きさ
  int stageSize_x=10;  //横ブロック数(ゲーム幅)
  int stageSize_y=19;  //縦ブロック数(ゲーム高さ)
  float stagePosition_x=(180)/2;  //プレイ画面の位置
  float stagePosition_y=(1920-1530)/2;
  PImage ui_img;  //画面背景
  Stage stage1;
  
  public Display(){    
    ui_img = loadImage("resources/main_ui.png");
    stage1 =new Stage();
  }
  public void showGhost() {

  }

  public void showText() {

  }

  public void showNext() {

  }

  public void showHold() {

  }
  
  public void drawBackground(){  //背景を含むゲーム全体画面
    image(ui_img, 0, 0,width, height);
  }
    
  
  public void drawgame(){  //ゲームプレイ画面
    for(i=0;i<stageSize_y;i++){
       for(j=0;j<stageSize_x+1;j++){
          if(stage1.stage[i][j]==0){
            rect(stagePosition_x-blockSize+blockSize*j,stagePosition_y+blockSize*i,blockSize,blockSize);
           }
      }
    }
    
  }

}
