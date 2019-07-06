class Stage {

  private int score;

  private int nextMino;

  private int holdMino;

  private boolean holdFlag;

  private int time=1;

  private int sx=5, sy=3;

  private int groundFlag;

  Mino minos[];

  int[][] stage = {{-1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1}, 
    {-1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1}, 
    {-1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1}, //5,3
    {-1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1}, 
    {-1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1}, //<=ここからミノ生成 (6,5)を回転軸に
    {-1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1}, 
    {-1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1}, 
    {-1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1}, 
    {-1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1}, 
    {-1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1}, 
    {-1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1}, 
    {-1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1}, 
    {-1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1}, 
    {-1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1}, 
    {-1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1}, 
    {-1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1}, 
    {-1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1}, 
    {-1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1}, 
    {-1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1}, 
    {-1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1}, 
    {-1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1}, 
    {-1, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, -1}, 
    {-1, 0, 0, 0, 0, 0, 0, 2, 2, 2, 0, -1}, 
    {-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1}};
  //private Mino mino;

  public Stage() {
    minos=new Mino[7];
    minos[0]=new TMino();
    minos[1]=new IMino();
    minos[2]=new JMino();
    minos[3]=new LMino();
    minos[4]=new SMino();
    minos[5]=new ZMino();
    minos[6]=new OMino();
  }

  public void stagesetMino(int sw, int cx, int cy, boolean delete) {        //ステージにミノの状態を反映 sw>1ブロック種類，sw=0削除
    for (int i = 0; i < 5; i++) {                                     // 縦方向
      for (int j = 0; j < 5; j++) {                                  // 横方向
        if (delete==false) {
          if (minos[sw-1].shape[i][j] == sw) {
            stage[i+cy][j+cx] = minos[sw-1].shape[i][j];
          }
        } else {
          if (minos[sw-1].shape[i][j] == sw) {
            stage[i+cy][j+cx] = 0;
          }
        }
      }
    }
  }
  

  public int BlockCheck(int cx, int cy,int sw) { //次に移動するブロックチェック  
    int flag = 0;
    
    for (int i = 0; i < 5 && flag == 0; i++) {
      for (int j = 0; j < 5 && flag == 0; j++) {
        // 落下ブロックがステージのブロックとぶつかった場合
        if (minos[sw-1].shape[i][j] >= 1 && stage[cy + i][cx + j] >= 1)  flag = 1;


        // 落下ブロックがステージの場外に出た場合
        if (minos[sw-1].shape[i][j] >= 1 && stage[cy + i][cx + j] == -1)  flag = 1;
      }
    }
 //<>//
    return(flag);
  }

  public void fallMino() {
    int blockID=5;
    stagesetMino(blockID, sx, sy, false);
    delay(1000);
    stagesetMino(blockID, sx, sy, true);
    sy++;
    if(BlockCheck(sx,sy,1)==1){
    sx=0;
    sy=3;
    }
    stagesetMino(blockID, sx, sy, false);
  }

  public void addScore() {
  }

  public void checkline() {
  }

  public void gameClear() {
  }

  public void gameOver() {
  }

  public void hold() {
  }

  public void next() {
  }

  public int randomMino() {
    return 0;
  }

  public void renCount() {
  }

  /**
   * 
   * せり上がり
   *
   **/
  public void addLine() {
  }

  public void getScore(int score) {
  }
}
