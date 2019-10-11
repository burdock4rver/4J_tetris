 //<>//
Sound sound;
Scene nowScene;


public void setup() {

  size(480, 848);

  setupFonts();
  sound = new Sound();

  switchScene(GAMESCENE);
} //<>//
 //<>//
public void switchScene (int scene) {
  sound.switchScene(scene);
  switch(scene) {
    //case TITLESCENE : nowScene = new TitleScene();  break;
    case GAMESCENE  : nowScene = new GameScene(sound);   break; //<>//
    //case RESULTSCENE: nowScene = new ResultScene(); break;
  }
}

public void draw() {
  nowScene.update();
}

private void setupFonts() {
  PFont font;
  font = loadFont("ModiThorson-48.vlw"); //<>//
  textFont(font, 48);
  textAlign(RIGHT);
}

public void keyPressed() {
  nowScene.keyPressed();
}

public void keyReleased() {
  nowScene.keyReleased();
}
