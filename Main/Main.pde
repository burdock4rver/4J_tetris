Display disp;
Stage stage;
Input input;

int pre_time;
int delta_time;  // 前フレームからの経過時間を持つ

public void setup() {
  
  size(540, 960);
  
  setupFont();
  stage = new Stage();
  disp = new Display(stage);
  input = new InputKey();
  pre_time = 0;
}

public void draw() {
  // 時間計測
  int ms = millis();
  delta_time = ms - pre_time;
  pre_time = ms;
 //update 
  input.update(delta_time); 
  stage.update(input, delta_time);
  disp.update();
  //ゲーム表示
  disp.drawBackground();
  disp.drawgame(stage);
  disp.showNext();
  disp.showHold();
  disp.drawFallingMino(stage.mino);
    disp.drawScore(stage);
 //キーリセット
  input.clean();
}

public void setupFont(){
  PFont font;
  font = loadFont("ModiThorson-48.vlw");
  textFont(font, 48);
  textAlign(RIGHT);
}

public void keyPressed() {
  input.checkInput(); 
}

public void keyReleased() {
  input.checkRelease();
}
