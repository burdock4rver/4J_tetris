class OneCushionScene extends Scene {
  final private int count;

  
  private PImage backImage;
  private float backAlpha;

  public OneCushionScene() {
    super();
    fill(#D0FFFF);
    textAlign(CENTER);
    text("Game Over", width/2, height/2);
    count = 2;
    backAlpha = 0.0;
    backImage = loadImage("resources/MAIN.jpg");
    
  }
  public void update() {
    super.update();
    countdown();
    
  }

  public void countdown() {
    if (backAlpha <= 255) backAlpha += 0.5;
   tint(255, (int)backAlpha);
   image(backImage, 0, 0, width, height);
   fill(#D0FFFF);
    textAlign(CENTER);
    text("Game Over", width/2, height/2);
    if (elapsedTimeS == count) {
      finishFlag = true;
      return;
    }
  }

  public void keyPressed() {}
  public void keyReleased() {}

  public boolean isFinish() { return finishFlag; }
}
