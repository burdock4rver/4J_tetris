public class TMino extends Mino {
  
  private int tSpinTriple[][] = {
    {0 ,0 ,1,-2,-2},
    {0 ,0 ,0,-2,-2},
    {-2,1 ,0,-2,-2},
    {-2,0 ,0,-2,-2},
    {-2,-2,0,-2,-2}};
    
  public TMino(int x, int y) {
    super(x, y);
    super.nextPointX = 430;
    super.nextPointY = 140;
    super.holdPointX = 10;                //ホールド座標X 
    super.holdPointY = 190;               //ホールド座標Y
    super.holdSize = 20;
    super.nextBlockSize = 20;
    super.shape = new int[][] {
      {0, 0, 0, 0, 0}, 
      {0, 0, 1, 0, 0}, 
      {0, 1, 1, 1, 0}, 
      {0, 0, 0, 0, 0}, 
      {0, 0, 0, 0, 0}};

    super.texture = loadImage("resources/minoTfront.png");
    super.id = 1;
  }
  
  public boolean superTSpin(int[][] stage,int posx,int posy){
    int sx = posx + 1; //この左上の座標と比較
    int sy = posy + 1;
     
     //入るかチェック
    if(tSpinTriple[2][2] != -2){ //-2の時はどちらでもいいので判定しない
        if(tSpinTriple[2][2] == 1){
          //ブロック1以上かをチェック
        }else{
          //ブロックがないかをチェック
        }
    }
    
    //はめ込みをする
    
    //左回転させ下に2右に1ずらすなどをして
    
    //戻りや向きが逆のパターンはのちにする
    return false;
  }

  public void showTexture() {
  }

  public void turnMino(int turn) {
  }
}
