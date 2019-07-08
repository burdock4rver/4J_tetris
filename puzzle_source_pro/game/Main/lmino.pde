public class LMino extends Mino {
  
  public LMino(int x, int y) {
    super(x, y);
    super.shape = new int[][] {
      {0, 0, 0, 0, 0}, 
      {0, 0, 0, 4, 0}, 
      {0, 4, 4, 4, 0}, 
      {0, 0, 0, 0, 0}, 
      {0, 0, 0, 0, 0}};
      
      super.texture = loadImage("resources/minoLfront.png");
      super.id = 4;
  }
  
  public LMino() {
    this(0, 0);
  }

  public void showTexture() {
  }

  public void turnMino(int turn) {
  }
}
