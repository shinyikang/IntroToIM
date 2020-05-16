//volume controller/slider
class Volume {
  int locX = 790; //x location of vol slider
  int locY = 490; //y location of vol slider
  int radius = 20; //raidus of the circular holder on the slider
  int leng = 180; //length of the slider
  int vx; //x location of the circular holder (y is constant)
  int vLoc = 120; //final x location of the circular holder

  void display() {
    
    pushMatrix();
    volume.vx = mouseX - locX; //vx is determined by the x distance bw mouse and starting loc of slider

    translate(locX, locY);
    
    //"volume" text
    fill(0);
    text("VOLUME", leng/2, 40);
    
    //slider base styling
    stroke(200);
    strokeWeight(8);
    line(0, 0, leng, 0);

    //color of holder
    fill(50);

    //if mouse is pressed on the slider
    if (mousePressed && volume.vx > 0 && volume.vx < leng && mouseY < locY + 4 && mouseY > locY-4) {
      //slider indicator styling (blue)
      stroke(89, 158, 184);
      line(0, 0, volume.vx, 0);
      stroke(200);
      
      //slider holder location is determined by the mouse
      circle(volume.vx, 0, radius);
      //final holder location also determined
      vLoc = volume.vx;
    } else {
      stroke(89, 158, 184);
      line(0, 0, vLoc, 0);
      stroke(200);
      circle(vLoc, 0, radius);
    }

    //based on the distance between the holder and the starting loc of slider, adjust the amplitude/volume of sound
    float amplitude = map(vLoc, 0, leng, 0, 1);
    music1.amp(amplitude);
    music2.amp(amplitude);

    popMatrix();
  }
}

//https://processing.org/reference/libraries/sound/SoundFile_amp_.html
