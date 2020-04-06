class Balloon {
  float x; //x location of balloon
  float y; //y location of balloon
  int lX = 80; //balloon's x length
  int lY = 100; //balloon's y length
  float speedX; //x speed of balloon
  float speedY; //y speed of balloon
  
  Balloon() {
    x = random(width); //balloon comes out from anywhere from the bottom
    y = height+100;
    speedX = random(-1,1); //x direction is random
    speedY = random(1,5); //speed of balloon going up is random within the given range
  }
  
  void update() {
    y -= speedY; //the balloon goes up, not down
    x += speedX;
  }
  
  void drawBalloon() {
    fill(240,128,128,191); //pink color
    noStroke();
    ellipse(x,y,lX,lY); //balloon
    triangle(x,y+(lY/2),x-15,y+(lY/2)+20,x+15,y+(lY/2)+20);
  }
  
  void bsmall() { //decrease the size of the balloon back to original size
    if (lX>80 && lY>100) {
      lX--;
      lY--;
    }
  }
  
  void bpop() { //pop the balloon
    lX++; //increase the balloon size
    lY++;
    if (lX > 110) { //if the balloon size is greater than the determined, place the balloon outside of the displayed screen
      speedX = 0;
      speedY = 0;
      y = -1000;
    }
  }
  
}

int totalBalloons = 0;
Balloon[] balloons; //create balloon object
int startTime; //When timer started
int totalTime = 500; //How long the timer should last
PFont font1;

void setup() { 
  size(600, 600);
  balloons = new Balloon[1000]; //total number of balloons
  startTime = millis(); //use millis for timer
  font1 = createFont("Monaco", 40); //font of the quote is Monaco
}

void draw() {
  // Always erase the screen first
  background(135,206,250);
  
  //calculate the passed Time from the start Time
  int passedTime = millis() - startTime;
  
  //every time the timer starts, continuously create a new balloon object until it reaches the maximum (1000)
  if (passedTime > totalTime) {
    balloons[totalBalloons] = new Balloon();
    totalBalloons ++ ;
    if (totalBalloons >= balloons.length) {
      totalBalloons = 0;
    }
    //re-determine the startTime whenever the timer ends
    startTime = millis();
  }
  
  //update the balloon object
  for (int i = 0; i < totalBalloons; i++ ) {
    balloons[i].update(); //make the balloon go up / move
    balloons[i].drawBalloon();
    
    float distance = dist(mouseX,mouseY,balloons[i].x,balloons[i].y); //determine how far away the mouse is from a particular balloon
    
    if (distance < (balloons[i].lY)/2) { //if the mouse is on the balloon, make the balloon pop
      balloons[i].bpop();
    }
    else { //if the mouse gets away from the balloon within a certain time, resize the balloon back to original
      balloons[i].bsmall();
    } 

  
  }
  
  //text "Nobody can be uncheered with a balloon" - Winnie the Pooh
  
  fill(245,255,250,100);
  rect(0,190,width,230); //rectangle to better show the text
  
  textFont(font1);
  fill(105,105,105);
  text("NOBODY CAN BE UNCHEERED \nWITH A BALLOON", 10, 250);
  textSize(20);
  text("Winnie the Pooh", 10, 400);
  
}

/*REFERENCES:
- https://github.com/michaelshiloh/simpleProcessingClassExample
- http://learningprocessing.com/examples/chp10/example-10-10-rain-catcher-game
- https://wp.nyu.edu/abudhabi_im_intro/meeting-16-week-8-long-day-thursdayapril2/
- https://processing.org/reference/PFont.html
- https://www.goodreads.com/quotes/182115-nobody-can-be-uncheered-with-a-balloon
*/
