class DemoInput extends Input {

  static final int INPUT_INTERVALL = 200; // ms

  int move_count;
  int rotate_count;
  int elapsed_time;  // 経過時間
  boolean done_drop;

  public DemoInput()
  {
    super();

    move_count = 0;
    rotate_count = 0;
    done_drop = true;
  }

  public void update(int delta_time) {
    //  新しいミノが来たら
    // 1. 落とす場所を決める
    // 2. 回転回数を決める
    // 3. 落とす
    if (elapsed_time > INPUT_INTERVALL) {
      elapsed_time = 0;
      if (done_drop) {        // 値設定
        if (move_count == 0) {
          move_count = (int)random(-5, 6);
        }

        if (rotate_count == 0) {
          rotate_count = (int)random(0, 5);
        } 

        done_drop = false;
      } else {                      // 実際に操作

        if (move_count != 0) {      // まずは左右移動
          if (move_count > 0) {     // move_countがマイナスなら左に移動、プラスなら右に移動
            state[R_MOVE] = true;
            move_count--;
          } else {
            state[L_MOVE] = true;
            move_count++;
          }
        } else {                    // 移動が終わっていたら回転
          if (rotate_count != 0) {  // 回転
            state[R_TURN] = true;
            rotate_count--;
          } else {                  // 回転が終わっていたら落とす
            done_drop = true;
            state[H_DROP] = true;
          }
        }
      }
    }
    elapsed_time += delta_time;
    
    super.update(delta_time);
  }

  public void checkInput() {
  }
  public void checkRelease() {
  }
}
