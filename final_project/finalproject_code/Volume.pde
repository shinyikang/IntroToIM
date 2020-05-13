class Volume {
  int locX = 790;
  int locY = 490;
  int radius = 20;
  int leng = 180;
  int vx;
  int vLoc = 120;

  void display() {
    stroke(200);
    strokeWeight(8);
    pushMatrix();
    volume.vx = mouseX - locX;

    translate(locX, locY);
    
    fill(0);
    text("VOLUME", leng/2, 40);

    line(0, 0, leng, 0);

    fill(50);

    if (mousePressed && volume.vx > 0 && volume.vx < leng && mouseY < locY + 4 && mouseY > locY-4) {
      stroke(89, 158, 184);
      line(0, 0, volume.vx, 0);
      stroke(200);
      circle(volume.vx, 0, radius);
      vLoc = volume.vx;
    } else {
      stroke(89, 158, 184);
      line(0, 0, vLoc, 0);
      stroke(200);
      circle(vLoc, 0, radius);
    }


    float amplitude = map(vLoc, 0, leng, 0, 1);
    music1.amp(amplitude);
    music2.amp(amplitude);

    popMatrix();
  }
}
