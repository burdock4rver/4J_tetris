abstract class Input {

  public final int R_MOVE = 0; 
  public final int L_MOVE = 1;
  public final int R_TURN = 2;
  public final int L_TURN = 3;
  public final int HOLD   = 4;
  public final int S_DROP = 5;
  public final int H_DROP = 6;
  
  public  boolean state[];      // 7種類のキーの状態 ON or OFF
  private int     wait[];       // 7種類のキーの待ち時間
  private int     input_delay;  // 次の入力を受け付けるまでの時間(ms)
  
  abstract void checkInput();
  
  public void cleanUpdate(int delta_time) {
    for (int i = 0; i < 7; i++) {
     state[i] = false;
     wait[i] -= delta_time;
    }
  }
  
  public Input() {
    input_delay = 50;
  }
}
