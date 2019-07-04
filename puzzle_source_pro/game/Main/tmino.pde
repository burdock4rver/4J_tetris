public class TMino extends Mino {

  private int shape[][];

  private char texture;

  private char shound;

  private int id;

  public TMino(){
    shape = new int[][] {
      {0, 0, 0, 0, 0}, 
      {0, 0, 1, 0, 0}, 
      {0, 1, 1, 1, 0}, 
      {0, 0, 0, 0, 0}, 
      {0, 0, 0, 0, 0}};
  }
  
  public void showTexture() {
  }
  
  public void turnMino(int turn) {
  }
}
