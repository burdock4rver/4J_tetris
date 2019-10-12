class Scene {
  Sound sound;
  boolean finishFlag;
  Scene() {
    finishFlag = false;
  }
  public void update() {}
  public void keyPressed() {}
  public void keyReleased() {}
  public boolean isFinish() { return finishFlag; }
}
