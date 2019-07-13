public class LMino extends Mino {

  public LMino(int x, int y) {
    super(x, y);
    super.nextPointX = 430;
    super.nextPointY = 140;
    super.holdPointX = 10;                //ホールド座標X 
    super.holdPointY = 190;               //ホールド座標Y
    super.holdSize = 20;
    super.nextBlockSize = 20;
    super.shape = new int[][] {
      {0, 0, 0, 0, 0}, 
      {0, 0, 0, 4, 0}, 
      {0, 4, 4, 4, 0}, 
      {0, 0, 0, 0, 0}, 
      {0, 0, 0, 0, 0}};

    super.texture = loadImage("resources/minoLfront.png");
    super.id = 4;
  }

  public void showTexture() {
  }

  public void turnMino(int turn) {
  }
}
