import java.io.IOException;

class TitleScene extends Scene {
  int select = -1;                   // 選択しているゲーム
  int state = -1;                    // how to playの切り替え用
  int count = 0;
  boolean selectFlag = false;
  boolean selectChange = false;      // 選択を切り替えたか
  boolean keyReleasedFlag = false;

  private int nowImage = 0;

  PImage back;   // 背景
  PImage start; 
  PImage how;
  PImage test;

  //Imageview view;

  final private int HOW_TO_PLAY = 2;
  
  Imageview view;

  public TitleScene() {
    super();
    view = new Imageview();
    //view = new Imageview();
    //Input.setInputInterface(new MixInput());    // キーボード・アーケード同時対応
    Input_title.setInputInterface(new KeyboardInput()); // キーボード
    back = loadImage("title_resources/select.png");
    start = loadImage("title_resources/start.png");
    how = loadImage("title_resources/how.png");
    test = loadImage("title_resources/test.png");
  }

  public void update() {
    super.update();

    if (Input_title.upPress()) {
    selectChange = true;

    if (select == -1)
      select = HOW_TO_PLAY;
    else
      select = 3 - select;
    }

    if (Input_title.downPress()) {
      selectChange = true;

      if (select == -1)
        select = 1;
      else
        select = 3 - select;
    }

    //HOW TO PLAYが押された場合
    if(select == HOW_TO_PLAY && Input_title.buttonA())
    {
      selectFlag = true;
    }

    if(selectFlag){
      state = 0;
      if(keyReleasedFlag && Input_title.buttonA()){
        state = -1;
        selectFlag = false;
        keyReleasedFlag = false;
      }
    }

    imageMode(CENTER);
    image(back, width/2,height/2);

    if (select == 1)
    {
      fill(41,171,226,80);
    }
    else
    {
      noFill();
    }
    oval(width/2, 393, 210, 30);

    if (select == HOW_TO_PLAY)
    {
      fill(41,171,226, 80);
    }
    else
      {
      noFill();
    }
    oval(width/2, 492, 210, 30);
  
    image(start, width / 2, 394);
    image(how, width / 2, 493);  

    view.HowToPlay();
  }
  
  public void keyPressed() {
    super.keyPressed();
    if (Input_title.up() || Input_title.down()) {
      switch(select){
        case 1:
          if (view.isRunnning()) break;
          finishFlag = true; break;
        case HOW_TO_PLAY :
          view.pushSwitch();
          break;
        default :
          state = -1;
          break;	
      }
    }
    
    if (Input_title.right()) view.goFrontPage();
    else if (Input_title.left()) view.goBackPage();
  }

  public void keyReleased() {
    super.keyReleased();
  }

  void oval(float x, float y, float w, float h) {
    rectMode(CENTER);
    stroke(41,171,226, 80);
    strokeWeight(1.5);

    rect(x, y, w, h, 15);
  }

  public boolean isFinish() { return finishFlag; }
}
