public class TMino extends Mino {
  
  public TMino(){
    super.shape = new int[][] {
      {0, 0, 0, 0, 0}, 
      {0, 0, 1, 0, 0}, 
      {0, 1, 1, 1, 0}, 
      {0, 0, 0, 0, 0}, 
      {0, 0, 0, 0, 0}};
      
      super.texture = loadImage("resources/minoTfront.png");
  }
  
  public void showTexture() {
  }
  
  public void turnMino(int turn) {
  }
}
