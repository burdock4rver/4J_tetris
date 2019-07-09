public abstract class Mino {
  private int shape[][];

  private PImage texture;

  // ミノの左上の座標 stageの配列にそのまま入る
  private int posx, posy;
  private int ghost_y;

  private int id;

  public abstract void showTexture();

  /*
   回転はstageとミノの状況からcheckMino(), rotateRight(), rotateLeft()をうまく使って実装する
   回転後のshapeは上書きしてもらって構わない
   各種ミノで実装すること
   posxとposyの変更も忘れずに
   */
  public boolean turnRight(int[][] stage) {
    int rotate_shape[][] = rotateRight();
    if (checkMino(stage, rotate_shape, 0, 0)) {
      shape = rotate_shape;
      return true;
    }
    return false;
  }
  
  public boolean turnLeft(int[][] stage) {
    int rotate_shape[][] = rotateLeft();
    if (checkMino(stage, rotate_shape, 0, 0)) {
      shape = rotate_shape;
      return true;
    }
    return false;
  }

  public Mino() {
    this(0, 0);
  }

  public Mino(int x, int y) {
    posx = x;
    posy = y;
    ghost_y = 0;
  }

  // 現在の位置から+(dx, dy)ずれた位置にミノが存在できるかを判定する
  public boolean checkMino(int[][] stage, int[][] shape, int dx, int dy) {
    for (int y = 0; y < 5; y++) {
      for (int x = 0; x < 5; x++) {
        if (shape[y][x] != 0) { 
          int check_x = x + posx + dx;
          int check_y = y + posy + dy;
          // インデックスがstage[][]からはみ出さないか監視
          if (check_x < 0 || check_x >= stage[0].length || check_y < 0 || check_y > stage.length) {
            return false; 
          }
          if (stage[check_y][check_x] != 0) {
            return false;
          }
        }
      }
    }
    return true;
  }

  public boolean checkMino(int[][] stage, int dx, int dy) {
    return checkMino(stage, shape, dx, dy);
  }

  // 落ちれたらtrue、落ちれなかったらfalse
  public boolean fall(int[][] stage) {
    if (checkMino(stage, 0, 1)) {
      posy++; 
      return true;
    }
    return false;
  }

  // 移動出来たらtrue, だめならfalse
  public boolean moveRight(int[][] stage) {
    if (checkMino(stage, 1, 0)) {
      posx++;
      return true;
    }
    return false;
  }

  public boolean moveLeft(int[][] stage) {
    if (checkMino(stage, -1, 0)) {
      posx--; 
      return true;
    }
    return false;
  }
  
  // ゴーストの位置を作成
  public void setGhost(int[][] stage) {
    for (int y = posy; checkMino(stage, 0, y - posy); y++) {
      ghost_y = y;
    }
  }

  /*
   ミノを回転させる
   この関数を使ってturnLeft、turnRightをつくる
   回転軸が異なるミノはオーバーライドすること
   */
  public int[][] rotateRight() { 
    int[][] rotation = new int[5][5];

    // 回転行列
    for (int y = 0; y < 5; y++) {
      for (int x = 0; x < 5; x++) {
        rotation[y][x] = shape[-(x - 2) + 2][y];
      }
    }

    return rotation;
  }

  public int[][] rotateLeft() { 
    int[][] rotation = new int[5][5];

    // 回転行列
    for (int y = 0; y < 5; y++) {
      for (int x = 0; x < 5; x++) {
        rotation[y][x] = shape[x][-(y - 2) + 2];
      }
    }

    return rotation;
  }
}
