class Scene {
  Sound sound;
  boolean finishFlag;
  protected int startTime;
  protected int elapsedTime;
  Scene() {
    finishFlag = false;
    startTime = millis() / 1000;
  }
  public void update() {
    elapsedTime = startTime - (millis() / 1000);
  }
  public void keyPressed() {}
  public void keyReleased() {}
  public boolean isFinish() { return finishFlag; }
}
