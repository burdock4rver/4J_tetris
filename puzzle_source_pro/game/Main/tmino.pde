public class TMino extends Mino {

  public TMino(int x, int y) {
    super(x, y);
    super.nextPointX = 430;
    super.nextPointY = 140;
    super.nextBlockSize = 20;
    super.shape = new int[][] {
      {0, 0, 0, 0, 0}, 
      {0, 0, 1, 0, 0}, 
      {0, 1, 1, 1, 0}, 
      {0, 0, 0, 0, 0}, 
      {0, 0, 0, 0, 0}};

    super.texture = loadImage("resources/minoTfront.png");
    super.id = 1;
  }

  public void showTexture() {
  }

  public void turnMino(int turn) {
  }
}
