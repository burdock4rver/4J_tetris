class InputKey extends Input {

  public InputKey() {
    super.state =  new boolean[7];
    super.wait = new int[7];
  }

  public void checkInput() {
    switch (key) {
    case 'd':
      if (super.wait[R_MOVE] <= 0) {
        super.state[R_MOVE] = true;
        super.wait[R_MOVE] = super.input_delay;
      }
      break;
    case 'a':
      if (super.wait[L_MOVE] <= 0) {
        super.state[L_MOVE] = true;
        super.wait[L_MOVE] = super.input_delay;
      }
      break;
    case ' ':
      if (super.wait[H_DROP] <= 0) {
        super.state[H_DROP] = true;
        super.wait[H_DROP] = super.input_delay;
      }
      break;
    }

    switch (keyCode) {
    case RIGHT:
      if (super.wait[R_TURN] <= 0) {
        super.state[R_TURN] = true;
        super.wait[R_TURN] = super.input_delay;
      }
      break;
    case LEFT:
      if (super.wait[L_TURN] <= 0) {
        super.state[L_TURN] = true;
        super.wait[L_TURN] = super.input_delay;
      }
      break;
    case UP:
      if (super.wait[HOLD] <= 0) {
        super.state[HOLD] = true;
        super.wait[HOLD] = super.input_delay;
      }
      break;
    case DOWN:
      if (super.wait[S_DROP] <= 0) {
        super.state[S_DROP] = true;
        super.wait[S_DROP] = super.input_delay;
      }
      break;
    }
  }
}
