class ResultScene extends Scene {
  public ResultScene() {
    background(0);
  }
  public void update() {}
  public void keyPressed() {}
  public void keyReleased() {}
  
  public Scene getNextScene() {
    return new TitleScene();
  }
}
