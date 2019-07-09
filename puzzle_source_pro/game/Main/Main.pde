Display disp;
Stage stage;
Input input;

int pre_time;
int delta_time;  // 前フレームからの経過時間を持つ

public void setup() {
  
  size(540, 960);
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
  
  input.update(delta_time); 

  disp.drawBackground();
  disp.drawgame(stage);
  disp.drawFallingMino(stage.mino);
  
  stage.update(input, delta_time);
  input.clean();
}

public void keyPressed() {
  input.checkInput(); 
}

public void keyReleased() {
  input.checkRelease();
}

//Display display;
