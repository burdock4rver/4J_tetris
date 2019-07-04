public class LMino extends Mino {

  public int shape[][];

  private char texture;

  private int id;

  public void showTexture() {
    shape = new int[][] {
      {0, 0, 0, 0, 0}, 
      {0, 0, 0, 1, 0}, 
      {0, 1, 1, 1, 0}, 
      {0, 0, 0, 0, 0}, 
      {0, 0, 0, 0, 0}};
  }

  public void turnMino(int turn) {
  }
}
