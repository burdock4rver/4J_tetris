import java.time.*;
import java.time.format.*;
import javax.swing.*;

class ResultScene extends Scene {
  PImage ui_img;       // 画面背景
  PImage a;
  PImage text_img[];
  
  float textLineX;
  float textLineY;
  final int TIME =12;
  final float INTERVAL = 13 + 23; 
  final float TEXTLINEX = 40; 
  final float TEXTLINEY = 120; 
  String dispResult[];
  int textAlpha[];
  int textAlphaNum;

  private Sound sound;
  private int startTime;

  public ResultScene(Sound sound) {
    text_img = new PImage[13];
    dispResult = new String[result.length];
    textAlpha = new int[result.length];
    //Input_title.setInputInterface(new MixInput());    // キーボード・アーケード同時対応
    Input_title.setInputInterface(new KeyboardInput()); // キーボード
    textAlphaNum = 0;
    this.sound = sound;
    sound.stopBGM();
    sound.playBGM(1);
    ui_img = loadImage("score/back.png");
    text_img[0] = loadImage("score/lenman.png");
    text_img[1] = loadImage("score/single.png");
    text_img[2] = loadImage("score/double.png");
    text_img[3] = loadImage("score/triple.png");
    text_img[4] = loadImage("score/tetris.png");
    text_img[5] = loadImage("score/tspin.png");
    text_img[6] = loadImage("score/tspinSingle.png");
    text_img[7] = loadImage("score/tspinDouble.png");
    text_img[8] = loadImage("score/tspinTriple.png");
    text_img[9] = loadImage("score/allclear.png");
    text_img[10] = loadImage("score/level.png");
    text_img[11] = loadImage("score/lines.png");
    text_img[12] = loadImage("score/playtime.png");
    textLineX = TEXTLINEX;
    textLineY = TEXTLINEY;
    changeTimeFormat();
    for(int i = 0;i < result.length;i++) {
      if(i != TIME)  dispResult[i] = String.valueOf(result[i]);
    }
    
    //
    
    startTime = millis();
    
  }
  public void update() {
    drawBackground();
    dispText();
    sound.stopCheck();
    sound.bgmRoop(1);
    
    //nキーを押すとスコア登録
    if(finishFlag)  settingScoreDB();
    
    if (millis() - startTime >= 30000)
      exit();
  }

  private void drawBackground() {  
    image(ui_img, 0, 0, width, height);
  }
  
  private void dispText(){
    textLineX = TEXTLINEX;
    textLineY = TEXTLINEY;
    for(int i = 0;i < text_img.length;i++){
      if(i == 10) textLineY += INTERVAL - 10;
      dispAText(i,textLineX,textLineY,text_img[i].width,text_img[i].height);
      dispBText(i,width -textLineX,textLineY+13,text_img[i].width,text_img[i].height,255);
      textLineY += INTERVAL;
    }
    if(textAlpha[textAlphaNum] >= 255 && textAlphaNum < result.length -1) textAlphaNum++;
    if(Input_title.buttonA()){
      if(textAlphaNum < result.length && textAlpha[textAlphaNum] <= 255)  textAlpha[textAlphaNum] +=51;
    }else{
      if(textAlphaNum < result.length && textAlpha[textAlphaNum] <= 255)  textAlpha[textAlphaNum] +=7;
    }
    dispScore();
  }
  
  
  private void dispAText(int img,float pointX,float pointY,float sizeWidth,float sizeHeight){
    tint(255,255,255,textAlpha[img]);
    image(text_img[img], pointX, pointY, sizeWidth, sizeHeight);
    noTint();
  }
  
  private void dispBText(int img,float pointX,float pointY,float sizeWidth,float sizeHeight,float alpha){
    textAlign(RIGHT);
    fill(#00ffff,textAlpha[img]);
    textSize(25);
    text(dispResult[img],pointX,pointY);
  }
  
  private void dispScore(){
    textAlign(CENTER);
    fill(#00ffff,textAlpha[result.length-1]);
    textSize(30);
    text(dispResult[result.length-1],width / 2,height - 142);
  }
  
  private void changeTimeFormat(){

    int time = result[TIME];    //time
    int minute = time / 60;
    int seconds = time % 60;
    String cMinute = String.valueOf(minute);
    String cSeconds = String.valueOf(seconds);
    if (cSeconds.length() == 1) cSeconds = "0"+ cSeconds;
    dispResult[TIME] = cMinute + ":" + cSeconds;
  }

  public void keyPressed() {}
  public void keyReleased() {
    if (key == 'n') finishFlag = true;
  }
  
  public boolean isFinish() { return finishFlag; }
  
  public void settingScoreDB(){
      // 獲得スコア(仮)
  int score = Integer.parseInt(dispResult[result.length-1]);
  
  // 接続先DBは"test", "pacman", "tetris", "unagi"から指定
  DataBase db = new DataBase("test");
  
  // スコア順にソートしてランキングを取得
  String res = db.query("SELECT * FROM ranking ORDER BY score DESC");
    
  // 接続できない場合はnullが返る
  if (res != null && !res.isEmpty()) {
    // ランキングを表示
    String[] ranking = split(res, '\n');
    
    for (String row : ranking) {
      String[] item = split(row, ',');
      println(item[0] + ": " + item[1]);
    }
  }
  
  //現在の順位を取得
  String participants = db.query("SELECT COUNT(*) + 1 FROM ranking");
  String myRank = db.query("SELECT COUNT(*) + 1 FROM ranking WHERE score > " + dispResult[result.length - 1]);
  
  
  print("あなたの順位は"+ participants +"人中 "+myRank + "位です。");
  
  // 接続できるかチェック 
  if (!db.canConnect()) {
    isFinish(); // タイトルへ戻る処理など
  }
  
  // Yes/Noダイアログを表示
  int regist = JOptionPane.showConfirmDialog(null, "ランキングに登録しますか？", "確認", JOptionPane.YES_NO_OPTION, JOptionPane.QUESTION_MESSAGE);
  
  // Yesが選択されたら
  if (regist == JOptionPane.YES_OPTION) {
    // 入力ダイアログを表示
    String name = JOptionPane.showInputDialog(null, "名前を入力してください");
    
    // 取り消しが押されたら
    if (name == null) {
      isFinish(); // タイトルへ戻る処理など
    }
    
    // 日時を取得
    LocalDateTime ldt = LocalDateTime.now();
    String datetime = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss").format(ldt);
    
    if("".equals(name)) name = "名無しのテトラー";
    
    db.query("INSERT INTO ranking VALUES ('" + name + "', " + score + ", '" + datetime + "')");
    
  // Noが選択されたら
  } else if (regist == JOptionPane.NO_OPTION) {
    isFinish(); // タイトルへ戻る処理など
  }
  
  isFinish();
  }
  
}
