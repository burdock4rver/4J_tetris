class DemoScene extends Scene {
  DemoDisplay disp;   
  DemoStage stage;
  Input input;
  Sound sound;

  int pre_time;
  int delta_time;  // 前フレームからの経過時間を持つ
  AudioPlayer bgm;  //テトリスBGM

  public DemoScene() {   
    super();
    
    sound = new Sound(GAMESCENE);
    stage = new DemoStage(sound);
    disp = new DemoDisplay(stage);
    // input = new InputKey();
    input = new DemoInput();
    // input = new inputButton(); // アーケードとキーボード両方のインプット
    pre_time = 0;  
  }   

  public void update() {
    super.update();
    // 時間計測
    delta_time = elapsedTimeMS - pre_time;
    pre_time = elapsedTimeMS;
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
      if (stage.update(input, delta_time)) finishFlag = true;

      disp.drawBackground();
      disp.drawgame(stage);
      disp.showNext();
      disp.showHold();
      disp.drawFallingMino(stage.mino);
      disp.drawScore(stage);
      // disp.dispTime(stage);
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

  public boolean isFinish() { return finishFlag; }
}
