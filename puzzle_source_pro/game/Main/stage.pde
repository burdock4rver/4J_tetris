class Stage {

  private int score;

  private int holdMino;

  private boolean holdFlag;

  private int time=1;

  private int sx=5, sy=2;// stage左上を原点として0から始まる

  private int groundFlag;

  // ミノ落下時間　コンストラクタで初期化してます
  private int preTime;        // 前フレームのmillis()の値
  private int elapsedTime;    // 前回ミノが落ちてからの経過時間
  private int fallDelay;      // ミノが落ちる速度 (ms)

  int blockID;

  RandomMino next;


  Mino minos[];

  int[][] stage = {{-1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1}, 
    {-1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1}, 
    {-1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1}, 
    {-1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1}, //5,3
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
    next = new RandomMino();
    blockID = next.getNextMino();

    preTime = millis();
    elapsedTime = 0;
    fallDelay = 1000;  }

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


  public int BlockCheck(int cx, int cy, int sw) { //次に移動するブロックチェック  
    int flag = 0;

    for (int i = 0; i < 5 && flag == 0; i++) {
      for (int j = 0; j < 5 && flag == 0; j++) {
        // 落下ブロックがステージのブロックとぶつかった場合
        if (minos[sw-1].shape[i][j] >= 1 && stage[cy + i][cx + j] >= 1)  flag = 1;

        // 落下ブロックがステージの場外に出た場合
        if (minos[sw-1].shape[i][j] >= 1 && stage[cy + i][cx + j] == -1)  flag = 1;
      }
    }

    return(flag);
  }

  public void fallMino() {
    
    if (elapsedTime >= fallDelay) {
      elapsedTime = 0;
      stagesetMino(blockID, sx, sy, false);
      stagesetMino(blockID, sx, sy, true);
      sy++;
      if (BlockCheck(sx, sy, blockID) == 1) {
        stagesetMino(blockID, sx, sy-1, false);
        sx=3;
        sy=3;
        blockID = next.getNextMino();
      }
      stagesetMino(blockID, sx, sy, false);
    }
    
    int ms = millis();
    elapsedTime += ms - preTime;
    preTime = ms;
  }
  
  public void moveMino(){
    
    if(key == 'a') {
      stagesetMino(blockID, sx, sy, true);
        if (BlockCheck(sx - 1 , sy, blockID) == 0){
          sx--;
          stagesetMino(blockID, sx, sy, false);
          key = '\0';
          }
      stagesetMino(blockID, sx, sy, false); 
    }
    if(key == 'd') {
      stagesetMino(blockID, sx, sy, true);
        if (BlockCheck(sx + 1 , sy, blockID) == 0){
          sx++;
          stagesetMino(blockID, sx, sy, false);
          key = '\0';
          }
      stagesetMino(blockID, sx, sy, false); 
    }
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
