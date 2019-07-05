class Stage {

  private int score;

  private int nextMino;

  private int holdMino;

  private boolean holdFlag;

  private int time=1;

  Mino minos[];
  
  int[][] stage = {{-1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1}, 
                   {-1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1}, 
                   {-1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1}, 
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
                   {-1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, -1}, 
                   {-1, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, -1}, 
                   {-1,-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1}};
  //private Mino mino;
  
  public Stage(){
    minos=new Mino[7];
    minos[0]=new TMino();
    minos[1]=new IMino();
    minos[2]=new JMino();
    minos[3]=new LMino();
    minos[4]=new SMino();
    minos[5]=new ZMino();
    minos[6]=new OMino();
  }

  public void stagesetMino(int sw,int cx,int cy) {        //ステージにミノの状態を反映 sw=>0ブロック
    for (int i = 0; i < 5; i++){                                     // 縦方向
      for (int j = 0; j < 5; j++){                             // 横方向
          stage[i+cy][j+cx] = minos[sw-1].shape[i][j];
      }
    }
  }

  public void fallMino() {
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
