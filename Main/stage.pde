class Stage { //<>// //<>// //<>// //<>//

  private int score;

  private int time=1;

  private int waitFall;       
  private int lastInputTime;  // 最後の入力からの経過時間

  private boolean isGround;   // ミノが接地しているか
  private int minoFreeTime;   // 地面に接している間にミノが自由に動ける時間
  private boolean doneHold;   // ホールドを使ったか
  private int fall_time;     //落下間隔時間
  private int clearLineNum;
  private int renCount;
  private int lastline;
  
  private boolean line1;  //スコア関連フラグ
  private boolean line2;
  private boolean line3;
  private boolean line4;
  
  private int oneLineScore = 10; //加算するスコア(変えてください)

  private Mino nextMino[];  

  private final int FIRST_X = 3;  // ミノの生成位置
  private final int FIRST_Y = 3;
  private final int NORMAL_FALL_TIME = 1000; //自然落下間隔時間
  private final int SOFT_FALL_TIME = 40;  //強制落下間隔時間
  private final int FREE_TIME = 4000;   // 接地後に最大何ms動かせるか
  private final int INPUT_WAIT = 1000;  // 最後の入力から何ms待つか(カサカサ)

  RandomMino next;
  private Mino mino;
  private Mino holdMino;

  int[][] stage;

  public Stage() {
    next = new RandomMino();  // ミノ生成
    mino = getNewMino(next.getNextMino());  // 最初のミノを生成
    nextMino =new Mino[4];
    for (int i = 0; i < 4; i++) nextMino[i]=getNewMino(next.getNextMino());  // Nextの4つのミノを生成
    holdMino = null;
    isGround = false;
    waitFall = 0;
    fall_time = NORMAL_FALL_TIME;
    minoFreeTime = 0;
    lastInputTime = 0;
    clearLineNum = 0;
    doneHold = false;
    
    line1 = false;
    line2 = false;
    line3 = false;
    line4 = false;
    renCount = 0;
    lastline = 0;
    
    stage = new int[][] { 
      {-1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1}, 
      {-1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1}, 
      {-1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1}, 
      {-1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1}, //3,3
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

  // このメソッドをdraw()で毎フレーム呼ぶ
  public void update(Input input, int delta_time) {

    // 操作されたか（カサカサ用）
    boolean wasOperate = false;

    // キーと操作の対応はclass InputKeyを参照されたし
    if (input.state[input.R_MOVE]) {        // 右移動
      wasOperate = mino.moveRight(stage);
    }

    if (input.state[input.L_MOVE]) {        // 左移動
      wasOperate = mino.moveLeft(stage);
    }

    if (input.state[input.R_TURN]) {        // 右回転
      wasOperate = mino.turnRight(stage);
      // 浮かび上がったときの処理
      boolean preIsGround = isGround;
      isGround = !mino.checkMino(stage, 0, 1);
      if (preIsGround && isGround) {
        waitFall = 0;
      }
    }

    if (input.state[input.L_TURN]) {        // 左回転
      wasOperate = mino.turnLeft(stage);
      // 浮かび上がったときの処理
      boolean preIsGround = isGround;
      isGround = !mino.checkMino(stage, 0, 1);
      if (preIsGround && isGround) {
        waitFall = 0;
      }
    }

    if (input.state[input.HOLD]) {          // ホールド
      hold();
    }

    if (input.state[input.S_DROP]) {        // ソフトドロップ
      fall_time = SOFT_FALL_TIME;
    } else {
      fall_time = NORMAL_FALL_TIME;
    }

    mino.setGhost(stage);    // ゴーストの位置設定

    if (input.state[input.H_DROP]) {        // ハードドロップ
      mino.posy = mino.ghost_y;
      minoFreeTime = FREE_TIME;
      isGround = true;
    }

    // ミノ落下
    waitFall += delta_time;
    if (waitFall >= fall_time) {
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
        // ラインチェックと次のミノの処理
        stageSetMino(mino);      // stage[][]にミノのブロックを反映
        gameOver();
        clearLineNum += checkline(mino.posy);    // ラインチェック
        clearLineNum = gameClear(clearLineNum);
        renCount(clearLineNum);
        addScore(renCount);            // 得点か三
        println(score);
        setNextMino();         // 次のミノを取り出す

        doneHold = false; 
        isGround = false;
        minoFreeTime = 0;
        lastInputTime = 0;
        waitFall = 0;
      }
    }
  }

  // 新しいミノのインスタンスを返す
  // idは17の間
  private Mino getNewMino(int id) {
    Mino nmino = null;

    switch(id) {
    case 1 : 
      nmino = new TMino(FIRST_X, FIRST_Y);
      break;
    case 2 :
      nmino = new IMino(FIRST_X, FIRST_Y);
      break;
    case 3 :
      nmino = new JMino(FIRST_X, FIRST_Y);
      break;
    case 4 :
      nmino = new LMino(FIRST_X, FIRST_Y);
      break;
    case 5 :
      nmino = new SMino(FIRST_X, FIRST_Y);
      break;
    case 6 :
      nmino = new ZMino(FIRST_X, FIRST_Y);
      break;
    case 7 :
      nmino = new OMino(FIRST_X, FIRST_Y);
      break;
    }
    return nmino;
  }

  // 次のミノをminoに代入する
  public void setNextMino() {
    mino = nextMino[0];
    for (int i = 0; i < 3; i++) {
      nextMino[i] = nextMino[i + 1];
    }
    nextMino[3] = getNewMino(next.getNextMino());
  }

  // ホールドの処理
  public void hold() {
    if (!doneHold) {           // 既にホールドを使っていないかのチェック
      minoFreeTime = 0;        // 各種変数の再設定
      lastInputTime = 0;
      waitFall = 0;
      doneHold = true;
      if (holdMino == null) {  // ホールドにミノがないとき
        holdMino = mino;
        setNextMino();
      } else {                 // ホールドにミノがあるときr
        Mino tmp = mino;
        mino = getNewMino(holdMino.id);
        holdMino = tmp;
      }
    }
  }

  public Mino getHoldMino(Mino holdMino2) {
    holdMino2 = holdMino;
    return holdMino2;
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

  // int cy : ミノの位置  
  // cyを基準にしてブロックを走査
  public int checkline(int cy) {
    int flag = 0;
    int blockCount = 0;    // 1行にあるブロックの数のバッファ
    int clearY = 0;
    int checknum = 4;    
    int clear = 0;

    for (int i = checknum; i >= 0; i -= 1) {    // 最大4行消えるから?
      flag = 0;
      blockCount = 0;
      for (int j = 1; j <= 10 && flag == 0; j += 1) {
        blockCount += 1;
        if ((cy - i + checknum)>=23)break;      // stage[][]を縦にはみ出さないように
        if (stage[cy - i+4][j] == -1)
          break;
        else if (stage[cy - i+ checknum ][j] == 0)
          flag = 1;
        if (blockCount == 10) {
          clearY = cy - i + checknum;
        }
      }
      if (flag == 0 && blockCount == 10) {
        clear += 1;
        for (int j = 1; j <= 10; j += 1) {
          stage[clearY][j] = 0;
        }
        for (int ci = clearY; ci > 0; ci -= 1) {
          if (stage[ci][1] == -1) break;
          for (int cj = 1; cj <= 10; cj += 1) {
            stage[ci][cj] = stage[ci - 1][cj];
          }
        }
      }

      blockCount = 0;
    }
    if(clear == 1)
      line1 = true;
    else if(clear == 2)
      line2 = true;
    else if(clear == 3)
      line3 = true;
    else if(clear == 4)
      line4 = true;
    return clear;
  }

  public void addScore(int ren) {//得点か三 値は適当に決めたので変更してください
    if(line1 == true)
    {
      score += (int)(oneLineScore*(1+0.1*ren)); 
    }
    else if(line2 == true)
    {
      score += (int)(oneLineScore*(1.2+0.1*ren)); 
    }
    else if(line3 == true)
    {
      score += (int)(oneLineScore*(1.3+0.1*ren)); 
    }
    else if(line4 == true)
    {
      score += (int)(oneLineScore*(1.4+0.1*ren)); 
    }
    downFlag();
  }

  public int gameClear(int clear) {
    if (clear >= 10)
    {
      println("clear");
      for (int y = 0; y < 23; y += 1)
      {
        for (int x = 1; x <= 10; x+= 1)
        {  
          stage[y][x] = 0;
        }
      }
      holdMino = null;
      doneHold = false;
      renCount = 0;
      lastline = 0;
      return 0;
    }
    return clear;
  }

  public void gameOver() {
    boolean gameOverFlag = false;
    //画面外にミノがあるか探す
    for (int y = 0; y < 4; y += 1)
    {
      for (int x = 1; x <= 10; x += 1)
      {  
        if (stage[y][x] != 0)
        {
          gameOverFlag = true;
          break;
        }
      }
    }
    //ミノが生成される場所にミノがあるか探す
    if (gameOverFlag == false)
    {
      for (int x = 4; x <= 6; x+= 1)
      {  

        if (stage[6][x] != 0&&nextMino[0].id == 1)
        {
          gameOverFlag = true;
          break;
        }
        if (stage[5][x] != 0||stage[4][x] != 0)
        {
          gameOverFlag = true;
          break;
        }
      }
      if (stage[5][7] != 0 && nextMino[0].id == 2)
      {
        gameOverFlag = true;
      }
    }
    //処理内容　盤面削除､ホールド初期化
    if (gameOverFlag == true)
    {
      for (int y = 0; y < 23; y += 1)
      {
        for (int x = 1; x <= 10; x+= 1)
        {  
          stage[y][x] = 0;
        }
      }
      holdMino = null;
      doneHold = false;
      renCount = 0;
      lastline = 0;
    }
  }



  public void getNext(Mino dispNextMino[]) {
    for (int i = 0; i < 4; i++) {
      dispNextMino[i] = nextMino[i];
    }
  }

  public void renCount(int count) {
    if(lastline != count )
    {
      renCount += 1;
    }
    else
    {
      renCount = 0;
      
    }
    lastline = count;
    println(renCount);
  }

  /**
   * 
   * せり上がり
   *
   **/
  public void addLine() {
  }
  public void downFlag(){
    line1 = false;
    line2 = false;
    line3 = false;
    line4 = false;
  }

  public void getScore(int score) {
  }
}
