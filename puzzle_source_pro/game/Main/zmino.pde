public class ZMino extends Mino {

  private int shape[][];

  private char texture;

  private int id;

  public ZMino(){
    shape = new int[][] {
      {0, 0, 0, 0, 0}, 
      {0, 0, 0, 0, 0}, 
      {0, 1, 1, 0, 0}, 
      {0, 0, 1, 1, 0}, 
      {0, 0, 0, 0, 0}};
  }

  public void showTexture() {
  }
  
  public void turnMino(int turn) {
  }
}
