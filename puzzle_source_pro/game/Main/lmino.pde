public class LMino extends Mino {
  
  public LMino() {
    super.shape = new int[][] {
      {0, 0, 0, 0, 0}, 
      {0, 0, 0, 1, 0}, 
      {0, 1, 1, 1, 0}, 
      {0, 0, 0, 0, 0}, 
      {0, 0, 0, 0, 0}};
      
      super.texture = loadImage("resources/minoLfront.png");
  }

  public void showTexture() {
  }

  public void turnMino(int turn) {
  }
}
