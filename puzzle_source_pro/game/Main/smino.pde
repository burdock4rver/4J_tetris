public class SMino extends Mino {

  public SMino(int x, int y) {
    super(x, y);
    super.shape = new int[][] {
      {0, 0, 0, 0, 0}, 
      {0, 0, 5, 5, 0}, 
      {0, 5, 5, 0, 0}, 
      {0, 0, 0, 0, 0}, 
      {0, 0, 0, 0, 0}};
      
      super.texture = loadImage("resources/minoSfront.png");
      super.id = 5;
  }
  
  public SMino() {
    this(0, 0);
  }
  
  public void showTexture() {
  }

  public void turnMino(int turn) {
  }
}
