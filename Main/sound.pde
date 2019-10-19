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
  private AudioPlayer tetris, aline, twoLine, drop, soft, tSpin1, tSpin2, tSpin3, allclear, hold;
  
  private AudioPlayer preSE, nowSE;
  
  private AudioPlayer sounds[];
  
  Sound(int sceneNum){
    setupSounds(sceneNum);
  }
  
  private void setupSounds(int secneNum){
    //bgm    = minim.loadFile("sounds/BGM.ogg");   
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
    
    tetris  = minim.loadFile("sounds/tetris1.mp3");  
    aline   = minim.loadFile("sounds/aLine.mp3");
    twoLine = minim.loadFile("sounds/twoLine.mp3");
    drop    = minim.loadFile("sounds/drop.mp3");
    soft    = minim.loadFile("sounds/soft.mp3");
    tSpin1  = minim.loadFile("sounds/tSpin1.mp3");
    tSpin2  = minim.loadFile("sounds/tSpin2.mp3");
    tSpin3  = minim.loadFile("sounds/tSpin3.mp3");
    allclear= minim.loadFile("sounds/allclear.mp3");
    hold    = minim.loadFile("sounds/hold.mp3");

    sounds = new AudioPlayer[] {
      tetris,
      aline,
      twoLine,
      drop,
      soft,
      tSpin1,
      tSpin2,
      tSpin3,
      allclear,
      hold
    };
    
    preSE = tetris;
  }

  /* BGMを再生する関数 */
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

  /* SEを再生する関数 呼び出しは文字列型を引数に */
  public void playSE(String soundName) {
    switch(soundName) {
      case "tetris"  : tetris.play();   nowSE = tetris;   break;
      case "aline"   : aline.play();    nowSE = aline;    break;
      case "twoLine" : twoLine.play();  nowSE = twoLine;  break;
      case "drop"    : drop.play();     nowSE = drop;     break;
      case "soft"    : soft.play();     nowSE = soft;     break;
      case "tSpin1"  : tSpin1.play();   nowSE = tSpin1;   break;
      case "tSpin2"  : tSpin2.play();   nowSE = tSpin2;   break;
      case "tSpin3"  : tSpin3.play();   nowSE = tSpin3;   break;
      case "allclear": allclear.play(); nowSE = allclear; break;
      case "hold"    : hold.play();     nowSE = hold;     break;
    }
    for (AudioPlayer se: sounds) {
      if(se == nowSE) se.rewind();
    }
  }
}
