import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
Minim minim = new Minim(this);
  
public class Sound{
  private AudioPlayer bgm;  //テトリスBGM
  
  Sound(){
    setupSounds();
  }
    
    
  private void setupSounds(){
    bgm = minim.loadFile("sounds/BGM.mp3"); //<>//
  }

  public AudioPlayer getSounds(String sound){
      switch(sound){
        case "BGM": return bgm;
      }
      return null;
  }
  
}
