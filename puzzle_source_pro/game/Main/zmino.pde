public class ZMino extends Mino {

  public ZMino(){
    super.shape = new int[][] {
      {0, 0, 0, 0, 0}, 
      {0, 0, 0, 0, 0}, 
      {0, 1, 1, 0, 0}, 
      {0, 0, 1, 1, 0}, 
      {0, 0, 0, 0, 0}};
      
      super.texture = loadImage("resources/minoZfront.png");
  }

  public void showTexture() {
  }
  
  public void turnMino(int turn) {
  }
}
