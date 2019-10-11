class GameScene extends Scene {
  Display disp; //<>// //<>//
  Stage stage;
  Input input;
  Sound sound;

  int pre_time;
  int delta_time;  // 前フレームからの経過時間を持つ
  AudioPlayer bgm;  //テトリスBGM

  public GameScene() { //<>// //<>//
    super();
    
    sound = new Sound(GAMESCENE);
    stage = new Stage(sound);
    disp = new Display(stage);
    input = new InputKey();
    pre_time = 0; //<>//
  } //<>// //<>//

  public void update() {
    super.update();
    // 時間計測
    int ms = millis();
    delta_time = ms - pre_time;
    pre_time = ms;
    //画面の状態
    int screenNum = 1;
    //update 
    input.update(delta_time); 
    disp.update();
    sound.playBGM();

      //ゲーム表示
      if (screenNum == 0) {  //スタート画面

      if (disp.startScreen(stage)) screenNum++;
    } else if (screenNum == 1) {  //ゲーム画面
      stage.update(input, delta_time);

      disp.drawBackground();
      disp.drawgame(stage);
      disp.showNext();
      disp.showHold();
      disp.drawFallingMino(stage.mino);
      disp.drawScore(stage);
      disp.dispTime(stage);
      disp.dispText(stage);
      disp.dispLevel(stage);
    }
    //キーリセット
    input.clean();
  }

  public void keyPressed() {
    input.checkInput();
  }

  public void keyReleased() {
    input.checkRelease();
  }

  public Scene getNextScene() {
    sound.stopAllSounds();
    return new ResultScene();
  }
}
