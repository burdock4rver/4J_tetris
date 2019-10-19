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

  final private int HOW_TO_PLAY = 2;

  public TitleScene() {
    super();
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
  
    switch(nowImage){
      case HOW_TO_PLAY :
        image(test, width / 2, 428);
        break;
      default :
        state = -1;
        break;	
    }
  
    image(start, width / 2, 394);
    image(how, width / 2, 493);  
  }
  public void keyPressed() {
    super.keyPressed();
  }
  public void keyReleased() {
    super.keyReleased();
    if(key == 'z') imageChange(select);
  }

  void oval(float x, float y, float w, float h) {
    rectMode(CENTER);
    stroke(41,171,226, 80);
    strokeWeight(1.5);

    rect(x, y, w, h, 15);
  }

  private void imageChange(int imageNum) {
    nowImage = (nowImage == 0) ? imageNum : 0;
    if (select == 1) finishFlag = true;
  }

  public boolean isFinish() { return finishFlag; }
}


