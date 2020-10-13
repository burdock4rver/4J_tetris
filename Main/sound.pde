//import ddf.minim.*;
//import ddf.minim.analysis.*;
//import ddf.minim.effects.*;
//import ddf.minim.signals.*;
//import ddf.minim.spi.*;
//import ddf.minim.ugens.*;
//Minim minim = new Minim(this);

//final int TITLESCENE = 0;
//final int GAMESCENE  = 1;
//final int RESULTSCENE = 2;
  
//public class Sound{
//  private AudioPlayer bgm;  //テトリスBGM
//  private AudioPlayer se2, se1;

//  private int start1, end1;
//  private int start2, end2;
//  private int start_gameBGM, start_trBGM, end_gameBGM;

//  private int nowBGM;
      
//  Sound(){
//    setupSounds();
//  }
  
//  private void setupSounds(){
//    start1 = 0;
//    end1= 0;

//    start2 =  1;
//    end2 = 2;

//    start_gameBGM = 0;
//    end_gameBGM = 50;
//    start_trBGM = 50;

//    bgm = minim.loadFile("sounds/bgm.mp3");

//    se1 = minim.loadFile("sounds/se.mp3");
//    //se2 = minim.loadFile("sounds/se.mp3");
//  }

//  /* BGMを再生する関数 */
//  public void playBGM(int museNum) {
//    nowBGM = museNum;
//    switch (nowBGM) {
//      case 0:
//        bgm.cue(start_trBGM * 2000);
//        bgm.setGain(-10);
//        break;
//      case 1:
//        bgm.cue(start_gameBGM * 2000);
//        bgm.shiftGain(-50, 0.0, 500);
//        break;
//    }
//    bgm.play();
//  }
  
//  public void stopAllSounds() {
//    bgm.close();
//    //se2.close();
//    se1.close();
//  }

//  public void stopBgm() {
//    bgm.close();
//  }

//  public void endingBgm() {
//    bgm.shiftGain(-10, -50, 3000);
//  }

//  public void stopCheck() {
//    //if (se2.position() >= this.end2 * 2000 - 200) se2.pause();
//    if (se1.position() >= this.end1 * 2000 - 200) se1.pause();
//  }

//  public void bgmRoop() {
//    switch (nowBGM) {
//      case 0: if (!bgm.isPlaying()) bgm.cue(start_trBGM); break;
//      case 1: if (bgm.position() >= this.end_gameBGM * 2000 - 200) bgm.cue(start_gameBGM); break;
//    }
//  }

//  /* SEを再生する関数 呼び出しは文字列型を引数に */
//  public void playSE(String soundName) {
//    switch(soundName) {
//      case "hold"    : start1 =  2; end1= 3; break;
//      case "aline"   : start1 =  3; end1= 5; break;
//      case "twoLine" : start1 =  5; end1= 7; break;
//      case "tetris"  : start1 =  7; end1=  9; break;
//      case "allclear": start1 =  9; end1= 10; break;
//      case "tSpin1"  : start1 = 10; end1= 12; break;
//      case "tSpin2"  : start1 = 12; end1= 14; break;
//      case "tSpin3"  : start1 = 14; end1= 16; break;
//      case "score"   : start1 = 16; break;
      
//      case "soft": start2 = 1; end2 = 2; break;
//      case "drop": start1 = 0; end1 = 2; break;
//    }
    
//    switch(soundName) {
//      /*case "soft":
//        se2.cue(start2 * 2000);
//        se2.play();
//        break;*/
//      case "drop":
//      default :
//        se1.cue(start1 * 2000);
//        se1.play();
//        break;	
//    }
//  }
//}

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
     //<>//
    bgm    = minim.loadFile("sounds/bgm2.mp3");
    titleResultBGM = minim.loadFile("sounds/title_result_BGM.mp3"); //<>//
    //tetris = minim.loadFile("sounds/tetris1.ogg");
    //aline  = minim.loadFile("sounds/aLine.ogg");
    //twoLine  = minim.loadFile("sounds/twoLine.ogg");
    //drop   = minim.loadFile("sounds/drop.ogg");
    //soft   = minim.loadFile("sounds/soft.ogg");
    //switch(secneNum) {
    //  case TITLESCENE: bgm = minim.loadFile("sounds/BGM.mp3"); break;
    //  case GAMESCENE: bgm = minim.loadFile("sounds/BGM.mp3"); break;
    //  case RESULTSCENE: bgm = minim.loadFile("sounds/BGM.mp3"); break;
    //}
    
    tetris = minim.loadFile("sounds/tetris1.mp3"); //<>//
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
}
