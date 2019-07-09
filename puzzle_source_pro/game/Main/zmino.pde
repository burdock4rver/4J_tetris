public class ZMino extends Mino {

  public ZMino(int x, int y){
    super(x, y);
    super.shape = new int[][] {
      {0, 0, 0, 0, 0}, 
      {0, 6, 6, 0, 0}, 
      {0, 0, 6, 6, 0}, 
      {0, 0, 0, 0, 0}, 
      {0, 0, 0, 0, 0}};
      
      super.texture = loadImage("resources/minoZfront.png");
      super.id = 6;
  }
  
  public void showTexture() {
  }
  
  public void turnMino(int turn) {
  }
}
