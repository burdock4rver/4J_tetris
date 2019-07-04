public class SMino extends Mino {

  private int shape[][];

  private char texture;

  private int Id;

  public SMino() {
    shape = new int[][] {
      {0, 0, 0, 0, 0}, 
      {0, 0, 1, 1, 0}, 
      {0, 1, 1, 0, 0}, 
      {0, 0, 0, 0, 0}, 
      {0, 0, 0, 0, 0}};
  }
  
  public void showTexture() {
  }

  public void turnMino(int turn) {
  }
}
