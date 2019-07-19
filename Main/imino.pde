public class IMino extends Mino {

  public IMino(int x, int y) {
    super(x, y);
    super.nextPointX = 430;
    super.nextPointY = 140;
    super.holdPointX = 15;                //ホールド座標X 
    super.holdPointY = 190;               //ホールド座標Y
    super.holdSize = 15;
    super.nextBlockSize = 18;
    super.shape = new int[][] {
      {0, 0, 0, 0, 0}, 
      {0, 0, 0, 0, 0}, 
      {0, 2, 2, 2, 2}, 
      {0, 0, 0, 0, 0}, 
      {0, 0, 0, 0, 0}};
    super.texture = loadImage("resources/minoIfront.png");
    super.id = 2;
  }

  public void showTexture() {
  }

  public void turnMino(int turn) {
  }
}
