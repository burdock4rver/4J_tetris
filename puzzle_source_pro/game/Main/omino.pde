public class OMino extends Mino {
  
  public OMino(int x, int y) {
    super(x, y);
    super.shape = new int[][] {
      {0, 0, 0, 0, 0}, 
      {0, 7, 7, 0, 0}, 
      {0, 7, 7, 0, 0}, 
      {0, 0, 0, 0, 0}, 
      {0, 0, 0, 0, 0}};
      
      super.texture = loadImage("resources/minoOfront.png");
      super.id = 7;
  }
  
  public void showTexture() {
  }

  public void turnMino(int turn) {
  }
}
