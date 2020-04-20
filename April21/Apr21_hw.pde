Rotater[] rotaters;

void setup() {
  size(640, 640);
  rotaters = new Rotater[500];
  for (int i=0; i< rotaters.length; i++) {
    float x = random(width);
    float y = random(height);
    float lineDistance = random(20, 50);
    //initiate with i for index
    rotaters[i]= new Rotater(x, y, i, lineDistance);
  }
}

void draw() {
  background(0);

  for (Rotater r : rotaters) {
    r.rotate();
    r.distance(rotaters);
  }
  
  textSize(20);
  text("Press the Mouse",20,30);
  
}

class Rotater {
  float centerX, centerY, x, y, angle, radius, speed, lineDistance, acceleration, direction;
  int index;

  Rotater(float _x, float _y, int i, float ld) {
    centerX= _x;
    centerY=_y;
    x=y=angle=0;
    radius=random(30, 75);
    speed = 0;
    index = i;
    lineDistance = ld;
    acceleration=0;
    //all of the rotaters now have the direction of -1
    direction=-1;
    //float coinflip = random(1);
    //if (coinflip>.5)
    //  direction=1;
  }

  void rotate() {
    //get cartesian coords from polar angle
    //add to center point of rotater to rotate around the actual spot
    x = cos(angle)*radius+centerX;
    y = sin(angle)*radius+centerY;
    //same as normal: vel+=acc
    speed+=acceleration;
    //angle is our pos now, mult by our direction
    angle+=speed*direction;
    //dampen it a little
    speed*=.98;
    acceleration=0;
    //rect(x, y, 2, 2);
  }

  void distance(Rotater[] rotaters) {
    //check the mouse, if close enough add some acceleration
    checkMouse();
    //check distance with all rotaters, if close enough draw line
    for (Rotater r : rotaters) {
      if (r.index != index) {
        if (dist(x, y, r.x, r.y)<lineDistance) {
          //for all strokes that are "close enough (<100)", make their color pink 
          if (dist(mouseX, mouseY, x, y)<100) {
            stroke(255, 182, 193);
          } 
          //for strokes that are not close enough (<100)...
          else {
            //make the strokes black/invisible
            stroke(0);
            //until the mouse is pressed, which is when the strokes turn visible into gray
            if (mousePressed == true) {
              stroke(220,220,220,50);
            }
          }
          line(x, y, r.x, r.y);
        }
      }
    }
  }

  void checkMouse() {
    //if mouse is *FAR* enough give some acceleration
    if (dist(mouseX, mouseY, x, y)>200 && mouseX!=pmouseX && mouseY!=pmouseY) {
      acceleration=.002;
    }
  }
}
