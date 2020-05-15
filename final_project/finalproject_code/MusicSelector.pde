//music selector for selecting which song to play
class MusicSelector {

  //size of the button (lX is width, lY is height)
  int lX = 200;
  int lY = 40;
  boolean mouseOnButton = false;

  void display(String name, int x, int y) {  //name is name of the song, x is x location, y is y location
    fill(255, 239, 217);
  
    //if mouse is hovering over the button,
    if (mouseX>x && mouseX<x+lX && mouseY>y && mouseY<y+lY) {
      // change the color of the button
      fill(245, 225, 184);
      //if the mouse presses on the button and neither music is playing (so that the song doesn't change while the tonearm is on the record to make it more realistic)
      if (mousePressed && !music1.isPlaying() && !music2.isPlaying()) {
        //change the music played depending on which button is pressed
        if (name == "SYMPHONY NO.5") {
          music = 0;
        } else {
          music = 1;
        }
      }
    }
    
    //if the button is pressed, change the color of the button
    if ((music == 1 && name == "MOON RIVER") | (music != 1 && name == "SYMPHONY NO.5")) {
      fill(220, 189, 143);
    }

    //styling of the button
    stroke(255);
    strokeWeight(5);
    rect(x, y, lX, lY, 5);
    textAlign(CENTER, CENTER);
    fill(0);
    //display the name on the button
    text(name, x+(lX/2), y+(lY/2));
  }
}
