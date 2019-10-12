class ResultScene extends Scene {
  public ResultScene() {
    background(0);
  }
  public void update() {}
  public void keyPressed() {}
  public void keyReleased() {
    if (key == 'n') finishFlag = true;
  }
  
  public boolean isFinish() { return finishFlag; }
}
