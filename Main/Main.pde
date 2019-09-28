Display disp;
Stage stage;
Input input;
Sound sound;

int pre_time;
int delta_time;  // 前フレームからの経過時間を持つ
AudioPlayer bgm;  //テトリスBGM

public void setup() {
  
  size(540, 960);
  
  setupFonts();
  stage = new Stage();
  disp = new Display(stage);
  input = new InputKey();
  sound = new Sound();
  bgm = sound.getSounds("BGM"); //<>//
  pre_time = 0;
}

public void draw() {
  // 時間計測
  int ms = millis();
  delta_time = ms - pre_time;
  pre_time = ms;
  //画面の状態
  int screenNum = 1;
 //update 
  input.update(delta_time); 
  stage.update(input, delta_time);
  disp.update();
  //音楽(BGM)
  if(!bgm.isPlaying()) bgm.rewind();//bgmループさせる
  bgm.play();
  
  //ゲーム表示
  if(screenNum == 0){  //スタート画面
    if(disp.startScreen()) screenNum++;
  }else if(screenNum == 1){  //ゲーム画面
  disp.drawBackground();
  disp.drawgame(stage);
  disp.showNext();
  disp.showHold();
  disp.drawFallingMino(stage.mino);
  disp.drawScore(stage);

}
 //キーリセット
  input.clean();
}

private void setupFonts(){
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
