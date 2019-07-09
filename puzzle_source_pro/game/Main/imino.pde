public class IMino extends Mino {

  public IMino(int x, int y) {
    super(x, y);
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
