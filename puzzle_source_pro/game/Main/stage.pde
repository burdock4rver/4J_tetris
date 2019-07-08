class Stage { //<>// //<>//

  private int score;

  private boolean holdFlag;

  private int time=1;

  private int waitFall;
  private int lastInputTime;  // 最後の入力からの経過時間

  private boolean isGround;   // ミノが接地しているか
  private int minoFreeTime;   // 地面に接している間にミノが自由に動ける時間
  private boolean doneHold;   // ホールドを使ったか

  private final int FALL_TIME = 200;
  private final int FREE_TIME = 4000;   // 接地後に最大何ms動かせるか
  private final int INPUT_WAIT = 1000;  // 最後の入力から何ms待つか(カサカサ)

  RandomMino next;
  private Mino mino;
  private Mino holdMino;

  int[][] stage;

  public Stage() {
    next = new RandomMino();
    setRandomMino();
    holdMino = null;
    isGround = false;
    waitFall = 0;
    minoFreeTime = 0;
    lastInputTime = 0;
    doneHold = false;
    stage = new int[][] { 
      {-1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1}, 
      {-1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1}, 
      {-1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1}, 
      {-1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1}, //5,3
      {-1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1}, //<=ここからミノ生成 (6,5)を回転軸に ここから下が表示される
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
      {-1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1}, 
      {-1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1}, 
      {-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1}};
  }

  public void update(Input input, int delta_time) {

    // 操作れたか（カサカサ用）
    boolean wasOperate = false;
    
    // キーと走査の対応はclass InputKeyを参照されたし
    if (input.state[input.R_MOVE]) {
      wasOperate = mino.moveRight(stage);
    }

    if (input.state[input.L_MOVE]) {
      wasOperate = mino.moveLeft(stage);
    }

    if (input.state[input.R_TURN]) {
    }

    if (input.state[input.L_TURN]) {
    }

    if (input.state[input.HOLD]) {
      changeHold();
    }

    if (input.state[input.S_DROP]) {
    }

    if (input.state[input.H_DROP]) {
    }

    // ミノ落下
    waitFall += delta_time;
    if (waitFall >= FALL_TIME) {
      isGround = !mino.fall(stage);  // 落下と接地判定
      waitFall = 0;
    }

    // カサカサとミノ設置
    if (isGround) {
      minoFreeTime += delta_time;
      
      if (wasOperate) {
        lastInputTime = 0;
      } else {
        lastInputTime += delta_time;
      }

      // ミノの位置が決まった
      if (minoFreeTime >= FREE_TIME || lastInputTime >= INPUT_WAIT) {
        stageSetMino(mino);
        doneHold = false; 
        isGround = false;
        minoFreeTime = 0;
        lastInputTime = 0;
        setRandomMino();
      }
    }
  }

  // 新しいミノのインスタンスを返す
  // idは17の間
  private Mino getNewMino(int id) {
    int first_x = 4;
    int first_y = 3;

    Mino nmino = null;

    switch(id) {
    case 1 : 
      nmino = new TMino(first_x, first_y);
      break;
    case 2 :
      nmino = new IMino(first_x, first_y);
      break;
    case 3 :
      nmino = new JMino(first_x, first_y);
      break;
    case 4 :
      nmino = new LMino(first_x, first_y);
      break;
    case 5 :
      nmino = new SMino(first_x, first_y);
      break;
    case 6 :
      nmino = new ZMino(first_x, first_y);
      break;
    case 7 :
      nmino = new OMino(first_x, first_y);
      break;
    }
    return nmino;
  }

  // 次のミノをminoに代入する
  public void setRandomMino() {
    mino = getNewMino(next.getNextMino());
  }

  // ホールドの処理
  public void changeHold() {
    if (!doneHold) {
      minoFreeTime = 0;
      lastInputTime = 0;
      doneHold = true;
      if (holdMino == null) {  // ホールドに何もないとき
        holdMino = mino;
        setRandomMino();
      } else {                 // ホールドにミノがあるとき
        Mino tmp = mino;
        mino = getNewMino(holdMino.id);
        holdMino = tmp;
      }
    }
  }

  // ミノをstage[][]にセットする
  public void stageSetMino(Mino mino) {
    for (int y = 0; y < 5; y++) {
      for (int x = 0; x < 5; x++) {
        if (mino.shape[y][x] != 0) {
          stage[y + mino.posy][x + mino.posx] = mino.shape[y][x];
        }
      }
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
