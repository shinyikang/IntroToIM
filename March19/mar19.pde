void setup() {
  size(500, 500);
  background(255, 255, 255);
  noStroke();
  //back hair
  fill(62, 38, 0);
  rect(155, 200, 170, 200);
  //clothes
  fill(random(0, 255), random(0, 255), random(0, 255));
  arc(250, 500, 400, 350, radians(180), radians(360));
  //neck
  fill(253, 235, 208);
  rect(215, 230, 70, 100);
  triangle(215,330,285,330,270,360);
  //face
  fill(253, 235, 208);
  ellipse(250, 185, 180, 210);
  //front hair
  fill(62, 38, 0);
  arc(240, 160, 190, 160, radians(150), radians(330));    
  //eyes
  fill(0, 0, 0);
  ellipse(290,180,20,25);
  ellipse(240,180,20,25);
  //mouth
  fill(255, 185, 196);
  stroke(0, 0, 0);
  strokeWeight(2);
  arc(260, 230, 60, 50, radians(10), radians(190), CHORD);  
  //nose
  stroke(0, 0, 0);
  strokeWeight(2);
  line(270,190,280,210);
  line(280,210,260,210);
}
