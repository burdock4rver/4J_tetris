public class SMino extends Mino {

  public SMino() {
    super.shape = new int[][] {
      {0, 0, 0, 0, 0}, 
      {0, 0, 5, 5, 0}, 
      {0, 5, 5, 0, 0}, 
      {0, 0, 0, 0, 0}, 
      {0, 0, 0, 0, 0}};
      
      super.texture = loadImage("resources/minoSfront.png");
  }
  
  public void showTexture() {
  }

  public void turnMino(int turn) {
  }
}
