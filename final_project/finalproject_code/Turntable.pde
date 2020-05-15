//basis of the turntable and the LP record
class Turntable {
  int lX = 650; //width of turntable
  int lY = 500; //height of turntable
  int center = 300; //center location of the LP record
  int radius = 200; //radius of the LP record
  float angle; //angle of the LP record (for spinning)


  void display() {
    //styling of turntable
    fill(224, 178, 150);
    noStroke();
    rect(50, 50, lX, lY, 20);
  }

  void displayLP() { //display LP record
    angle+=1; //increase the angle of LP record
    imageMode(CENTER);
    pushMatrix();
    noStroke();
    translate(center, center); //translate the centered LP record image to determined location
    rotate(radians(angle)); //rotate the LP record
    //change the cover of lp record based on what music is played
    if (music == 1) {
      image(moonriverIm, 0, 0, 200, 200);
    }
    else {
      image(beethovenIm, 0, 0, 200, 200);
    }
    image(lprecord, 0, 0, radius*2, radius*2);
    popMatrix();
  }
}
