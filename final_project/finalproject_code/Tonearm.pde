//tone arm that changes the starting time of the song
class Tonearm {
  //use PVector for the tonear
  //reference: https://forum.processing.org/two/discussion/14433/rotate-line-in-such-a-way-that-one-point-is-in-the-middle-of-the-canvas-and-other-follows-the-mouse
  PVector tonearm = new PVector(0, 0);
  
  float startX = 600; //x location (origin) of the tonearm
  float startY = 150; //y location (origin) of the tonearm
  float finalX = 0; //x location where the tonearm ends
  float finalY = 300; //y location where the tonearm ends
  float armLength = 300; //length of the tonearm

  float distance; //distance between tonearm and center of LP record
  float mouseDistance; //distance between tonearm and mouse
  float musicTime; //duration of the music
  int totalTime = 7000; //total time for the timer (to move the tonearm as the music progresses)


  boolean mousenearArm = false; //mouse is not clicking on the arm in the beginning
  boolean onLP = false; //tonearm is not on the LP record in the beginning

  void display(float totalTime, int savedTime) { 
    pushMatrix();
    tonearm.x = mouseX-startX; //x distance from mouse to the origin of tonearm
    tonearm.y = mouseY-startY; //y distance from mouse to the origin of tonearm
    tonearm.normalize(); //normalize the tonearm vector to length 1 
    tonearm.mult(armLength); //multiply the legnth to arm length
    translate(startX, startY); //translate to origin of tonearm

  //determine boolean value for mousenearArm based on whether the mouse is near the tonearm origin
    if ((dist(mouseX, mouseY, startX, startY) < 300) && (mouseY > startY+150) && (mouseX < width-350)) {
      mousenearArm = true;
    } else {
      mousenearArm = false;
    }

    //styling of the tonearm (thick line)
    stroke(100);
    strokeWeight(20);
    //if the mouse is pressed near the tonearm origin
    if ((mousePressed) && (mousenearArm)) {
      //move the tonearm/line according to where the mouse is
      line(0, 0, tonearm.x, tonearm.y);
      //if the mouse is pointing at a position where the tonearm "can" (realistically) move to,
      //change the final position of tonearm based on where the mouse is
      if ((tonearm.x > -230) && (tonearm.x < 100) && (tonearm.y > 200)) { //values were determined through trial and error
        finalX = tonearm.x;
        finalY = tonearm.y;
      }
    //move the tonearm accordingly
    } else {
      line(0, 0, finalX, finalY);
    }

    //styling of the tonearm origin
    fill(60);
    circle(0, 0, 80);
    fill(230);
    noStroke();
    circle(0, 0, 10);

    //calculate distance between the LP record center and the endpoint of the tonearm
    distance = dist(-300, 150, finalX, finalY);

    //if tonearm is on the LP record,
    if (distance < turntable.radius) {
      //change the bool variable of onLP to true
      onLP = true;
      //map the music time onto the distance between the tonearm and the lp record center
      musicTime= map(distance, 50, 200, totalTime, 0); //ref: https://processing.org/reference/map_.html
      //calculate the time that passed
      int passedTime = millis() - savedTime;
      if (distance > 90) {
        //make the tonearm endpoint gradually head towards the lp record center (based on a timer) 
        if (passedTime > totalTime) {
          finalX -= 0.015;
          finalY -= 0.015;
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
