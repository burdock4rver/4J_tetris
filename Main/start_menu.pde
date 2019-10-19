import java.io.IOException;

int select = -1;                   // 選択しているゲーム
int state = -1;                    // how to playの切り替え用
boolean selectChange = false;      // 選択を切り替えたか

PImage back;   // 背景
PImage start; 
PImage how;
PImage test;

void setup() {
  // 画面設定
  //fullScreen(); // フルスクリーン
  size(480, 848); // ウィンドウ
  frameRate(30);  // フレームレート
  noCursor();     // マウスカーソル非表示
  
  // 入力設定
  //Input.setInputInterface(new MixInput());    // キーボード・アーケード同時対応
  Input.setInputInterface(new KeyboardInput()); // キーボード
  back = loadImage("select.png");
  start = loadImage("start.png");
  how = loadImage("how.png");
  test = loadImage("test.ong");
}

void draw()
{ 
  
  if (Input.upPress()) {
    selectChange = true;

    if (select == -1)
      select = 2;
    else
      select = 3 - select;
  }
  
  if (Input.downPress()) {
    selectChange = true;

    if (select == -1)
      select = 1;
    else
      select = 3 - select;
  }
  
  //HOW TO PLAYが押された場合
  if(select == 2 && Input.buttonA())
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
  
  //switch(state)
  

  
  image(start, width / 2, 394);
  image(how, width / 2, 493);  
}

void oval(float x, float y, float w, float h) {
  rectMode(CENTER);
  stroke(41,171,226, 80);
  strokeWeight(1.5);

  rect(x, y, w, h, 15);
}
