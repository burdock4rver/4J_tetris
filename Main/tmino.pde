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
  
  public boolean superTSpin(int[][] stage,int[][] rotate_shape,int posx,int posy,boolean RLFlag){
    /*
    stage : stage 
    rotate_shape : rotate_shape
    posx : ミノのX座標
    posy : ミノのY座標
    RLFlga : true -> L
             false-> R
    */
    int sx = posx; //この左上の座標と比較
    int sy = posy + 1;
     //入るかチェック
     if (RLFlag == true)
     {
       sx += 1;
       for(int j = 0;j < 5;j += 1)
       {
         if(j+sy > 23)break;
           for(int i = 0;i < 5;i += 1)
           {
             if(i+sx >= 12)break;
               if(tSpinTriple[j][i] != -2){ //-2の時はどちらでもいいので判定しない
                  if(stage[j+sy][i+sx] == -1)break;
                  if(tSpinTriple[j][i] == 1){
                     //ブロック1以上かをチェック
                     if(stage[j+sy][i+sx] <= 0)
                     return false;
                   }else if(tSpinTriple[j][i] == 0){
                     //ブロックがないかをチェック
                     if(stage[j+sy][i+sx] != 0)
                     return false;
                   }
               }
  
           }
       }
     }
     else if (RLFlag == false)
     {
       sx -= 1;
       for(int j = 0;j < 5;j += 1)
       {
         if(j+sy > 23)break;
           for(int i = 0;i < 5;i += 1)
           {
             if(i+sx >= 12)break;
              if(tSpinTriple[j][4-i] != -2){ //-2の時はどちらでもいいので判定しない
                  if(stage[j+sy][i+sx] == -1)break;
                  if(tSpinTriple[j][4-i] == 1){
                     //ブロック1以上かをチェック
                     if(stage[j+sy][i+sx] <= 0)
                     return false;
                   }else if(tSpinTriple[j][4-i] == 0){
                     //ブロックがないかをチェック
                     if(stage[j+sy][i+sx] != 0)
                     return false;
                   }
               }
           }
       }
     }
    //はめ込みをする
    //左回転させ下に2右に1ずらすなどをして
    
    if (checkMino(stage, rotate_shape, 1, 2) && RLFlag == true) {
      super.posx += 1;
      super.posy += 2;
      super.shape = rotate_shape;
      return true;
    }
    else if (checkMino(stage, rotate_shape, -1, 2) && RLFlag == false) {
      super.posx -= 1;
      super.posy += 2;
      super.shape = rotate_shape;
      return true;
    }
    
    //戻りや向きが逆のパターンはのちにする
    return false;
  }

  public void showTexture() {
  }

  public void turnMino(int turn) {
  }
}
