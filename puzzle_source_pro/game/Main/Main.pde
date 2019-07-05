Display disp;

public void setup() {
  size(540,960);
  disp=new Display();
}

public void draw() {
  disp.drawBackground();
  disp.stage1.stagesetMino(1,5,5);
  disp.drawgame();
  
  
}

//Display display;
