public class OMino extends Mino {
  
  public OMino() {
    super.shape = new int[][] {
      {0, 0, 0, 0, 0}, 
      {0, 0, 0, 0, 0}, 
      {0, 0, 7, 7, 0}, 
      {0, 0, 7, 7, 0}, 
      {0, 0, 0, 0, 0}};
      
      super.texture = loadImage("resources/minoOfront.png");
  }
  
  public void showTexture() {
  }

  public void turnMino(int turn) {
  }
}
