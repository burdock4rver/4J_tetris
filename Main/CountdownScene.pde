class CountdownScene extends Scene {
  final private int count;

  private int preTime;

  private int text_size;

  public CountdownScene() {
    super();
    background(0, 255);
    count = 3;
    preTime = -1;
    text_size = 70;
  }
  public void update() {
    super.update();
    countdown();
  }

  public void countdown() {
    if (elapsedTimeS == preTime) return ;
    if (elapsedTimeS == count) {
      finishFlag = true;
      return;
    }
    background(0,255);
    textSize(100);
    fill(#D0FFFF);
    text(count - elapsedTimeS, width/2 + text_size/2, height/2 + text_size/2);
    preTime = elapsedTimeS;
  }

  public void keyPressed() {}
  public void keyReleased() {}

  public boolean isFinish() { return finishFlag; }
}
