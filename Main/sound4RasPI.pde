import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
Minim minim = new Minim(this);
  
public class Sound{
  private AudioPlayer bgm;  //テトリスBGM
  private AudioPlayer se1, se2;
  
  private AudioPlayer preSE, nowSE;
  
  private AudioPlayer sounds[];
  
  Sound(){
    setupSounds();
  }
    
    
  private void setupSounds(){
    //bgm    = minim.loadFile("sounds/BGM.ogg"); //<>// //<>//
    //tetris = minim.loadFile("sounds/tetris1.ogg");
    //aline  = minim.loadFile("sounds/aLine.ogg");
    //twoLine  = minim.loadFile("sounds/twoLine.ogg");
    //drop   = minim.loadFile("sounds/drop.ogg");
    //soft   = minim.loadFile("sounds/soft.ogg");
    
    bgm = minim.loadFile("sounds/BGM.mp3");
    se1 = minim.loadFile("sounds/drop.mp3");
    se2 = minim.loadFile("sounds/soft.mp3");
    
    sounds = new AudioPlayer[] {
      se1, se2
    };
    
    preSE = tetris;
  }

  public void playBGM() {
    if(!bgm.isPlaying()) bgm.rewind();
    bgm.play();
  }
  
  public void playSE(String soundName) {
    AudioPlayer useSE;
    if (nowSE == se1) useSE = se2;
    else useSE = se1;
    switch(soundName) {
      case "tetris": useSE = minim.loadFile("sounds/tetris1.mp3"); break;
      case "aline" : useSE = minim.loadFile("sounds/aline.mp3"); break;
      case "twoLine" : useSE = minim.loadFile("sounds/aline.mp3"); break;
      case "drop"  : useSE = minim.loadFile("sounds/drop.mp3"); break;
      case "soft"  : useSE = minim.loadFile("sounds/soft.mp3"); break;
    }
    useSE.play();
    nowSE = useSE; 
    for (AudioPlayer se: sounds) {
      if(se == nowSE) se.rewind();
    }
  }
}