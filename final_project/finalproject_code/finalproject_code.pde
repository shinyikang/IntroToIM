//load files (image, sound, and font)
PImage lprecord, logo, moonriverIm, beethovenIm;
import processing.sound.*;
SoundFile music1, music2;
PFont font;

//initiate objects from classes
Turntable turntable = new Turntable(); //basis of the turntable and the LP record
Tonearm tonearm = new Tonearm(); //tonearm
MusicSelector moonriverB = new MusicSelector(); //button for Moon River
MusicSelector beethovenB = new MusicSelector(); //button for Symphony No.5
Volume volume = new Volume(); //volume slider

boolean onLP = false; //in the beginning, the tonearm is not on the LP Record
boolean started = false; //in the beginning, the music has not yet started

//variable for the time passed after the music starts
int savedTime; 
//if music = 1, Moon River is played. else, Beethoven's Symphony No.5 is played
int music = 1;

void setup() {
  size(1050, 600);
  //load images
  lprecord = loadImage("lp.png");
  logo = loadImage("logo_updated.png");
  moonriverIm = loadImage("moonriver.png");
  beethovenIm = loadImage("beethoven.png");
  
  smooth();
  //load sound files
  music1 = new SoundFile(this, "moonriver.mp3"); //music1 is Moon River
  music2 = new SoundFile(this, "beethoven.mp3"); //music2 is Symphony No.5 by Beethoven
  savedTime = millis(); //savedTime is measured by millis.. for determining the start time
  //of the music depending on tonearm's location
  //ref: http://learningprocessing.com/examples/chp10/example-10-04-timer
  
  font = loadFont("Courier-15.vlw"); //font styling
  textFont(font, 20);
}

void draw() {
  background(175, 248, 211);
  
  //position the LP logo
  image(logo, 880, 190, 200, 260);
  
  //display the buttons for each music (refer to "MusicSelector" class)
  moonriverB.display("MOON RIVER", 780, 350);
  beethovenB.display("SYMPHONY NO.5", 780, 390);

  //display the turntable and the spinning LP record
  turntable.display();
  turntable.displayLP();  
  
  //display and operate the volume controller/slider
  volume.display();
  
  //if "moon river" is played...
  if (music == 1) {
    //display and move the tonearm based on moonriver
    tonearm.display(music1.duration(), savedTime);
  //if "symphony no.5" is played...
  } else {
    //display and move the tonearm based on the symphony
    tonearm.display(music2.duration(), savedTime);
  }

  //if the tonearm is not on the LP record, stop the music
  if (!tonearm.onLP) {
    music1.stop();
    music2.stop();
  }
  
}

//whenever the mouse is released (after being pushed)...
void mouseReleased() {
  //if the tonearm and the mouse are on LP record when the mouse is released..
  if (tonearm.onLP && (dist(mouseX, mouseY, turntable.center, turntable.center) < turntable.radius)) {    
    //and if either music is playing or has not even started at all..
    if ((music1.isPlaying()) | (music2.isPlaying()) | (!started)) {
      //jump the starting time of the recording accordingly based on where the tonearm is located
      if (music == 1) {
        music1.jump(tonearm.musicTime);
      } else {
        music2.jump(tonearm.musicTime);
      }
      //if music didn't start yet, indicate that the music started playing and start playing
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
