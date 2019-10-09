public class IMino extends Mino {
  public IMino() {
    super.shape = new int[][] {
      {0, 0, 0, 0, 0}, 
      {0, 0, 0, 0, 0}, 
      {0, 2, 2, 2, 2}, 
      {0, 0, 0, 0, 0}, 
      {0, 0, 0, 0, 0}};
      super.texture = loadImage("resources/minoIfront.png");
  }

  public void showTexture() {
  }

  public void turnMino(int turn) {
  }
}
