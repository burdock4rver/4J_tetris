import java.io.IOException;

class TitleScene extends Scene {
  int select = -1;                   // 選択しているゲーム
  int state = -1;                    // how to playの切り替え用
  boolean selectChange = false;      // 選択を切り替えたか

  PImage back;   // 背景
  PImage start; 
  PImage how;
  PImage test;

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
      select = 2;
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
  if(select == 2 && Input_title.buttonA())
  {
    state = 0;
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
   
  if (select == 2)
  {
    fill(41,171,226, 80);
  }
  else
  {
    noFill();
  }
  oval(width/2, 492, 210, 30);
  
  switch(state){
    case 0 :
      image(test, width / 2, 428);
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
    if(key == 'n') finishFlag = true;
  }

  void oval(float x, float y, float w, float h) {
    rectMode(CENTER);
    stroke(41,171,226, 80);
    strokeWeight(1.5);

    rect(x, y, w, h, 15);
  }

  public boolean isFinish() { return finishFlag; }
}


