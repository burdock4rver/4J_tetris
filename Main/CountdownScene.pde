class CountdownScene extends Scene {
  final private int count;
  private int startTime;

  private int s;
  private int preS;

  private int text_size;

  public CountdownScene() {
    super();
    background(0, 255);
    count = 3;
    startTime = millis();
    s = 0;
    preS = -1;
    text_size = 70;
  }
  public void update() {
    super.update();
    countdown();
  }

  public void countdown() {
    s = (millis() - startTime) / 1000;
    if (s == preS) return ;
    if(s == count) {
      finishFlag = true;
      return;
    }
    background(0,255);
    textSize(100);
    fill(#D0FFFF);
    text(count - s, width/2 + text_size/2, height/2 + text_size/2);
    preS = s;
  }

  public void keyPressed() {}
  public void keyReleased() {}

  public boolean isFinish() { return finishFlag; }
}
