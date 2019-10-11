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
  private String preSeName;
  
  Sound(){
    setupSounds();
  }
    
     //<>//
  private void setupSounds(){
    //bgm    = minim.loadFile("sounds/BGM.ogg"); //<>// //<>// //<>//
    //tetris = minim.loadFile("sounds/tetris1.ogg");
    //aline  = minim.loadFile("sounds/aLine.ogg");
    //twoLine  = minim.loadFile("sounds/twoLine.ogg"); //<>//
    //drop   = minim.loadFile("sounds/drop.ogg");
    //soft   = minim.loadFile("sounds/soft.ogg");
    
    bgm = minim.loadFile("sounds/BGM.mp3");
    se1 = minim.loadFile("sounds/soft.mp3");
    se2 = minim.loadFile("sounds/drop.mp3");
  }

  public void playBGM() {
    if(!bgm.isPlaying()) bgm.rewind();
    bgm.play();
  }

  public void playSE() {
    se1.rewind();
    se1.play();
  }
  
  public void playSE(String soundName) {
    if (preSeName != soundName) { //<>//
      switch(soundName) { //<>//
        case "tetris": se2 = minim.loadFile("sounds/tetris1.mp3"); break;
        case "aline" : se2 = minim.loadFile("sounds/aLine.mp3"); break;
        case "twoLine" : se2 = minim.loadFile("sounds/twoLine.mp3"); break;
        case "drop"  : se2 = minim.loadFile("sounds/drop.mp3"); break;
      }
    } else {
      se2.rewind();
    }
    
    se2.play(); //<>//
    preSeName = soundName;  //<>//
  }
}
