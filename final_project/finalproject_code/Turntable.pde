class Turntable {
  int lX = 650;
  int lY = 500;
  int center = 300;
  int radius = 200;
  float angle;


  void display() {
    fill(224, 178, 150);
    noStroke();
    rect(50, 50, lX, lY, 20);
  }

  void displayLP() {
    angle+=1;
    imageMode(CENTER);
    pushMatrix();
    noStroke();
    translate(center, center);
    //fill(246, 249, 132);
    fill(143, 206, 230);
    //circle(0, 0, 400);
    rotate(radians(angle));
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
