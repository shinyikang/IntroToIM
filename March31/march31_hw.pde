float xlength;
float ylength;

void setup() 
{ 
  size(600, 600);
  background(0);
  
  //generate text: click anywhere
  textSize(20);
  fill(255);
  text("click anywhere!", 10, 30); 
  
  //predetermined sparkles
  for (int i = 1; i < 30; i = i + 1) { //...will only consist of 30 strokes
    sparkle(100,200); //in the following locations
    sparkle(400,300);
    sparkle(200,500);
  }
}

void draw() {
  //create the sparkles whenever 
  if (mousePressed) {
    sparkle(mouseX,mouseY); 
    //the location of the sparkle depends on the place the mouse is pressed
    //the longer the mouse is pressed, the more sparkle strokes there will be
  }
}

void sparkle(int x, int y) {
  //the color of the strokes are random
  stroke(random(0, 255), random(0, 255), random(0, 255));
  strokeWeight(2);
  //the length/direction of the strokes are random (within the given range)
  xlength=random(-40,40);
  ylength=random(-40,40);
  pushMatrix();
  translate(x,y);
  line(0,0,xlength,ylength);
  popMatrix();
}

/*Reference
http://dada.compart-bremen.de/docUploads/ProgrammInformation21_PI21.pdf
https://processing.org/reference/line_.html
https://processing.org/tutorials/transform2d/
https://wp.nyu.edu/abudhabi_im_intro/meeting-14-week-7-long-day-thursday-march-19-240-520/
https://processing.org/tutorials/interactivity/
*/
