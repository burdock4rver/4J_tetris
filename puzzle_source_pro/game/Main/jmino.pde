public class JMino extends Mino {

  public JMino(int x, int y) {
    super(x, y);
    super.shape = new int[][] {
      {0, 0, 0, 0, 0}, 
      {0, 3, 0, 0, 0}, 
      {0, 3, 3, 3, 0}, 
      {0, 0, 0, 0, 0}, 
      {0, 0, 0, 0, 0}};
      
      super.texture = loadImage("resources/minoJfront.png");
      super.id = 3;
  }

  public void showTexture(){
  
  }
  public void turnMino(int turn) {
  }
}
