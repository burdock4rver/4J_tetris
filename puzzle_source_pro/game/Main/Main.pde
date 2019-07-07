Display disp;

public void setup() {
  size(540, 960);
  disp=new Display();
}

public void draw() {
  disp.drawBackground();
  disp.stage1.moveMino();
  disp.stage1.fallMino();
  disp.drawgame();

}

//Display display;
