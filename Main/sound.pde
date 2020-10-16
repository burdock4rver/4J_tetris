import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
Minim minim = new Minim(this);

final int TITLESCENE = 0;
final int GAMESCENE  = 1;
final int RESULTSCENE = 2;
  
public class Sound{
  private AudioPlayer bgm,titleResultBGM;  //テトリスBGM
  private AudioPlayer tetris, aline, twoLine, drop, soft, tSpin1, tSpin2, tSpin3, hold;
  
  private AudioPlayer preSE, nowSE;
  
  private AudioPlayer sounds[];
  
  Sound(/*int sceneNum*/){
    setupSounds(/*sceneNum*/);
  }
  
  private void setupSounds(/*int secneNum*/){
     //<>// //<>//
    bgm    = minim.loadFile("sounds/bgm2.mp3");
    titleResultBGM = minim.loadFile("sounds/title_result_BGM.mp3"); //<>// //<>//
    
    tetris = minim.loadFile("sounds/tetris1.mp3"); //<>// //<>//
    aline  = minim.loadFile("sounds/aLine.mp3");
    twoLine  = minim.loadFile("sounds/twoLine.mp3");
    drop   = minim.loadFile("sounds/drop.mp3");
    soft   = minim.loadFile("sounds/soft.mp3");
    tSpin1 = minim.loadFile("sounds/tSpin1.mp3");
    tSpin2 = minim.loadFile("sounds/tSpin2.mp3");
    tSpin3 = minim.loadFile("sounds/tSpin3.mp3");
    hold   = minim.loadFile("sounds/hold.mp3");

    
    sounds = new AudioPlayer[] {
      tetris,
      aline,
      twoLine,
      drop,
      soft,
      tSpin1,
      tSpin2,
      tSpin3,
      hold
    };
    
    preSE = tetris;
  }

  public void playBGM(int a) { //t
    if(a == 0){
      if(!bgm.isPlaying()) bgm.rewind();
      bgm.play();
    }else if(a == 1){
      if(!titleResultBGM.isPlaying()) titleResultBGM.rewind();
      titleResultBGM.play();
    }
    
  }
  
  public void stopAllSounds() {
    bgm.close();
    tetris.close();
    aline.close();
    twoLine.close();
    drop.close();
    soft.close();
    titleResultBGM.close();
    hold.close();
  }
  
  public void playSE(String soundName) {
    switch(soundName) {
      case "tetris": tetris.play(); nowSE = tetris; break;
      case "aline" : aline.play();  nowSE = aline;  break;
      case "twoLine" : twoLine.play();  nowSE = twoLine;  break;
      case "drop"  : drop.play();   nowSE = drop;   break;
      case "soft"  : soft.play();   nowSE = soft;   break;
      case "tSpin1": tSpin1.play(); nowSE = tSpin1; break;
      case "tSpin2": tSpin2.play(); nowSE = tSpin2; break;
      case "tSpin3": tSpin3.play(); nowSE = tSpin3; break;
      case "hold"  : hold.play();   nowSE = hold;   break;
    }
    for (AudioPlayer se: sounds) {
      if(se == nowSE) se.rewind();
    }
  }
  
  public void stopBGM(){
    bgm.pause();
    titleResultBGM.pause();
  }
  
  public void stopBgm(){
  }
  
  public void endingBgm() {
  }
  
  public void stopCheck() {
  }
  
  public void bgmRoop() {
  }
  
  public void bgmRoop(int bgmNum){
    if(bgmNum == 0){
      if(!bgm.isPlaying()) bgm.loop();
    }
    if(bgmNum == 1){
      if(!titleResultBGM.isPlaying()) titleResultBGM.loop();
    }
  }
}
