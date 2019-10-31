public class JMino extends Mino {

  public JMino() {
    super.shape = new int[][] {
      {0, 0, 0, 0, 0}, 
      {0, 3, 0, 0, 0}, 
      {0, 3, 3, 3, 0}, 
      {0, 0, 0, 0, 0}, 
      {0, 0, 0, 0, 0}};
      
      super.texture = loadImage("resources/minoJfront.png");
  }

  public void showTexture(){
  
  }
  public void turnMino(int turn) {
  }
}
