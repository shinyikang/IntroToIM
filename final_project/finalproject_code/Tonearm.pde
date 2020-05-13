class Tonearm {
  PVector tonearm = new PVector(0, 0);
  float startX = 600;
  float startY = 150;
  float finalX = 0;
  float finalY = 300;
  float armLength = 300;
  int x, y;

  float distance;
  float mouseDistance;
  float musicTime;
  int totalTime = 7000;


  boolean mousenearArm = false;
  boolean onLP = false;

  void display(float totalTime, int savedTime) { 
    pushMatrix();
    tonearm.x = mouseX-startX;
    tonearm.y = mouseY-startY;
    tonearm.normalize();
    tonearm.mult(armLength);
    translate(startX, startY);

    if ((dist(mouseX, mouseY, startX, startY) < 300) && (mouseY > startY+150) && (mouseX < width-350)) {
      mousenearArm = true;
    } else {
      mousenearArm = false;
    }

    stroke(100);
    strokeWeight(20);
    if ((mousePressed) && (mousenearArm)) {
      line(0, 0, tonearm.x, tonearm.y);
      if ((tonearm.x > -230) && (tonearm.x < 100) && (tonearm.y > 200)) { //values were determined through trial and error
        finalX = tonearm.x;
        finalY = tonearm.y;
      }
    } else {
      line(0, 0, finalX, finalY);
    }

    fill(60);
    circle(0, 0, 80);

    fill(230);
    noStroke();
    circle(0, 0, 10);

    distance = dist(-300, 150, finalX, finalY);

    if (distance < 200) {
      onLP = true;
      musicTime= map(distance, 50, 200, totalTime, 0);
      int passedTime = millis() - savedTime;
      if (distance > 90) {
        if (passedTime > totalTime) {
          finalX -= 0.01;
          finalY -= 0.01;
          savedTime = millis();
        }
      }
    } else {
      onLP = false;
      musicTime = 0;
    }

    popMatrix();
  }
}


//https://forum.processing.org/two/discussion/14433/rotate-line-in-such-a-way-that-one-point-is-in-the-middle-of-the-canvas-and-other-follows-the-mouse
