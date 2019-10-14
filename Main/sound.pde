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
  private AudioPlayer bgm;  //テトリスBGM
  private AudioPlayer tetris, aline, twoLine, drop, soft;
  
  private AudioPlayer preSE, nowSE;
  
  private AudioPlayer sounds[];
  
  Sound(int sceneNum){
    setupSounds(sceneNum);
  }
  
  private void setupSounds(int secneNum){
    //bgm    = minim.loadFile("sounds/BGM.ogg"); //<>// //<>// //<>//
    //tetris = minim.loadFile("sounds/tetris1.ogg");
    //aline  = minim.loadFile("sounds/aLine.ogg");
    //twoLine  = minim.loadFile("sounds/twoLine.ogg");
    //drop   = minim.loadFile("sounds/drop.ogg");
    //soft   = minim.loadFile("sounds/soft.ogg");
    switch(secneNum) {
      case TITLESCENE: bgm = minim.loadFile("sounds/BGM.mp3"); break;
      case GAMESCENE: bgm = minim.loadFile("sounds/BGM.mp3"); break;
      case RESULTSCENE: bgm = minim.loadFile("sounds/BGM.mp3"); break;
    }
    
    tetris = minim.loadFile("sounds/tetris1.mp3"); //<>// //<>//
    aline  = minim.loadFile("sounds/aLine.mp3");
    twoLine  = minim.loadFile("sounds/twoLine.mp3");
    drop   = minim.loadFile("sounds/drop.mp3");
    soft   = minim.loadFile("sounds/soft.mp3");
    
    sounds = new AudioPlayer[] {
      tetris,
      aline,
      twoLine,
      drop,
      soft
    };
    
    preSE = tetris;
  }

  public void playBGM() {
    if(!bgm.isPlaying()) bgm.rewind();
    bgm.play();
  }
  
  public void stopAllSounds() {
    bgm.close();
    tetris.close();
    aline.close();
    twoLine.close();
    drop.close();
    soft.close();
  }
  
  public void playSE(String soundName) {
    switch(soundName) {
      case "tetris": tetris.play(); nowSE = tetris; break;
      case "aline" : aline.play();  nowSE = aline;  break;
      case "twoLine" : twoLine.play();  nowSE = twoLine;  break;
      case "drop"  : drop.play();   nowSE = drop;   break;
      case "soft"  : soft.play();   nowSE = soft;   break;
    }
    for (AudioPlayer se: sounds) {
      if(se == nowSE) se.rewind();
    }
  }
}
