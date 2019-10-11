 //<>//
Scene nowScene;


public void setup() {

  size(480, 848);

  setupFonts();
  nowScene = new TitleScene();
} //<>//

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
  if(key == 'n') nowScene = nowScene.getNextScene();
}

public void keyReleased() {
  nowScene.keyReleased();
}
