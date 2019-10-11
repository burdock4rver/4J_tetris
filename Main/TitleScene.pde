class TitleScene extends Scene {
  public TitleScene() {
    super();
    background(255,0,0);
  }
  public void keyPressed() {
    super.keyPressed();
  }
  public void keyReleased() {
    super.keyReleased();
  }
  public Scene getNextScene() {
    return new GameScene();
  }
}
