class MusicSelector {

  int lX = 200;
  int lY = 40;

  void display(String name, int x, int y) {  
    fill(255, 239, 217);

    if (mouseX>x && mouseX<x+lX && mouseY>y && mouseY<y+lY) {
      fill(245, 225, 184);
      if (mousePressed && !music1.isPlaying() && !music2.isPlaying()) {
        if (name == "SYMPHONY NO.5") {
          music = 0;
        } else {
          music = 1;
        }
      }
    }
    
    if ((music == 1 && name == "MOON RIVER") | (music != 1 && name == "SYMPHONY NO.5")) {
      fill(220, 189, 143);
    }

    stroke(255);
    strokeWeight(5);
    rect(x, y, lX, lY, 5);
    textAlign(CENTER, CENTER);
    fill(0);
    text(name, x+(lX/2), y+(lY/2));
  }
}
