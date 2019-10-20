   
Scene nowScene;


public void setup() {

  size(480, 848);

  setupFonts();
  nowScene = new DemoScene();
}   

public void draw() {
  nowScene.update();
  if (nowScene.isFinish()) goNextScene();
}

private void setupFonts() {
  PFont font;  
  font = loadFont("ModiThorson-48.vlw");  
  textFont(font, 48);
}

public void keyPressed() {
  nowScene.keyPressed();
}

public void keyReleased() {
  nowScene.keyReleased();
}

public void goNextScene() {
  switch (nowScene.getClass().getName()) {
    case "Main$TitleScene": nowScene = new CountdownScene(); break;
    case "Main$CountdownScene": nowScene = new GameScene(); break;
    case "Main$GameScene": nowScene = new ResultScene(); break;
    case "Main$ResultScene": nowScene = new TitleScene(); break;
    default :
      println(""+nowScene.getClass().getName());
    break;	
  }
}
