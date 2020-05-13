PImage lprecord, logo, moonriverIm, beethovenIm;
import processing.sound.*;
SoundFile music1, music2;
PFont font;

Turntable turntable = new Turntable();
Tonearm tonearm = new Tonearm();
MusicSelector moonriverB = new MusicSelector();
MusicSelector beethovenB = new MusicSelector();
Volume volume = new Volume();

boolean onLP = false;
boolean started = false;

int savedTime;
int music = 1;

void setup() {
  size(1050, 600);
  lprecord = loadImage("lp.png");
  logo = loadImage("logo_updated.png");
  moonriverIm = loadImage("moonriver.png");
  beethovenIm = loadImage("beethoven.png");
  smooth();
  music1 = new SoundFile(this, "moonriver.mp3");
  music2 = new SoundFile(this, "beethoven.mp3");
  savedTime = millis();
  font = loadFont("Courier-15.vlw");
  textFont(font, 20);
}

void draw() {
  background(175, 248, 211);
  
  image(logo, 880, 190, 200, 260);
  
  moonriverB.display("MOON RIVER", 780, 350);
  beethovenB.display("SYMPHONY NO.5", 780, 390);

  turntable.display();
  turntable.displayLP();  
  
  volume.display();
  
  if (music == 1) {
    tonearm.display(music1.duration(), savedTime);
  } else {
    tonearm.display(music2.duration(), savedTime);
  }

  if (tonearm.distance > 200) {
    music1.stop();
    music2.stop();
  }
  
}

void mouseReleased() {
  if (tonearm.onLP && (dist(mouseX, mouseY, turntable.center, turntable.center) < turntable.radius)) {    
    if ((music1.isPlaying()) | (!started)) {
      if (music == 1) {
        music1.jump(tonearm.musicTime);
      } else {
        music2.jump(tonearm.musicTime);
      }
    } else {
      started = true;
      if (music == 1) {
        music1.play();
      } else {
        music2.play();
      }
    }
  }
}
/*https://processing.org/reference/map_.html
 https://processing.org/reference/libraries/sound/SoundFile.html
 http://learningprocessing.com/examples/chp10/example-10-10-rain-catcher-game
 http://learningprocessing.com/examples/chp10/example-10-04-timer
 https://tympanus.net/codrops/2016/06/15/interactive-record-player/
 https://www.cdandlp.com/en/ray-conniff-and-his-orchestra-chorus/moon-river-20-romantic-hits/lp/r3095255222/
 */
