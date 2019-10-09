import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
Minim minim = new Minim(this);
  
public class Sound{
  private AudioPlayer bgm;  //テトリスBGM
  private AudioPlayer tetris, aline, drop, soft;
  
  private AudioPlayer preSE, nowSE;
  
  private AudioPlayer sounds[];
  
  Sound(){
    setupSounds();
  }
    
    
  private void setupSounds(){
    bgm    = minim.loadFile("sounds/BGM.mp3"); //<>//
    tetris = minim.loadFile("sounds/tetris1.mp3");
    aline  = minim.loadFile("sounds/aLine.mp3");
    drop   = minim.loadFile("sounds/drop.mp3");
    soft   = minim.loadFile("sounds/soft.mp3");
    sounds = new AudioPlayer[] {
      tetris,
      aline,
      drop,
      soft
    };
    
    preSE = tetris;
  }

  public AudioPlayer getSounds(String sound){
      switch(sound){
        case "BGM": return bgm;
        case "tetris": ;
      }
      return null;
  }
  
  public void playBGM() {
    if(!bgm.isPlaying()) bgm.rewind();
    bgm.play();
  }
  
  public void playSE(String soundName) {
    switch(soundName) {
      case "tetris": tetris.play(); nowSE = tetris; break;
      case "aline" : aline.play();  nowSE = aline;  break;
      case "drop"  : drop.play();   nowSE = drop;   break;
      case "soft"  : soft.play();   nowSE = soft;   break;
    }
    for (AudioPlayer se: sounds) {
      if(se == nowSE) se.rewind();
    }
  }
}
