abstract class Input {

  public final int R_MOVE = 0; 
  public final int L_MOVE = 1;
  public final int R_TURN = 2;
  public final int L_TURN = 3;
  public final int HOLD   = 4;
  public final int S_DROP = 5;
  public final int H_DROP = 6;
  
  public  boolean state[];      // 7種類のキーの状態 ON or OFF
  public  boolean keyState[];   // 押されているキー
  private int     wait[];       // 7種類のキーの待ち時間
  private int     input_delay;  // 次の入力を受け付けるまでの時間(ms)
  
  abstract void checkInput();
  
  abstract void checkRelease();
  
  // draw()の最初で呼ぶ
  public void update(int delta_time) {
    if (keyState[R_MOVE]) {
      
      if (wait[R_MOVE] >= input_delay) {
        if (!state[L_MOVE]) {
          state[R_MOVE] = true;  
        }
        wait[R_MOVE] = 0;
      }
    }
    if (keyState[L_MOVE]) {
      if (wait[R_MOVE] >= input_delay) {
        if (!state[R_MOVE]) {
          state[L_MOVE] = true;  
        }
        wait[R_MOVE] = 0;
      }
    }
    if (keyState[R_TURN]) {
      if (wait[R_TURN] >= input_delay) {
        if (!state[L_TURN]) {
          state[R_TURN] = true; 
        }
        wait[R_TURN] = 0;
      }
    }
    if (keyState[L_TURN]) {
      if (wait[R_TURN] >= input_delay) {
        if (!state[R_TURN]) {
          state[L_TURN] = true; 
        }
        wait[R_TURN] = 0;
      }
    }
    if (keyState[HOLD]) {
      if (wait[HOLD] >= input_delay) {
        state[HOLD] = true;
        wait[HOLD] = 0;
      }
    }
    if (keyState[S_DROP]) {
      state[S_DROP] = true;
    }
    if (keyState[H_DROP]) {
      if (wait[H_DROP] >= input_delay) {
        state[H_DROP] = true;
        wait[H_DROP] = 0;
      }
    } else {
      wait[H_DROP] = input_delay;
    }
    
    for (int i = 0; i < 7; i++) {
      if (i == H_DROP) {
        continue;
      }
      wait[i] += delta_time;
    }
  }
  
  // draw()の最後で呼ぶ
  public void clean() {
    for (int i = 0; i < 7; i++) {
     state[i] = false;
    }
  }
  
  public Input() {
    input_delay = 200;
  }
}
