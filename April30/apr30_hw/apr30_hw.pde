/*Creator: Amy Kang
Title: Dynamic Pointillism
Assignment no.10 - Intro to IM

for this dynamic pointillism piece, differently-colored dots/squares are placed randomly at first, but when the user presses any key or clicks on the screen, 
the dots/squares move to their supposed-to-be positions, properly pointillizing and thus resembling the image being used.*/

PImage tree;
int pointillize = 10; //length of the dots/squares

void setup() {
  size(400, 334);
  tree = loadImage("tree.png");
  smooth();
}

void draw() {
  background(255);

  for (int i = 1; i < 3000; i = i + 1) { //limit the number of dots/squares to 3000
  //randomize the location of where the dots/squares will get their colors from
    int x = int(random(tree.width));
    int y = int(random(tree.height));
    int loc = x + y*tree.width;

    // Look up the RGB color in the source image at the randomized location and set the color of the dots/squares as that
    loadPixels();
    float r = red(tree.pixels[loc]);
    float g = green(tree.pixels[loc]);
    float b = blue(tree.pixels[loc]);
    noStroke();
    fill(r, g, b, 100);

    if (keyPressed | mousePressed) { //if any key or the mouse is pressed, make a proper pointillized image 
      //rect(x, y, pointillize, pointillize); //create squares
      circle(x, y, pointillize); //create circles
    } else { //if nothing is pressed, make the locations of the colored dots/squares random
      //rect(int(random(tree.width)), int(random(tree.height)), pointillize, pointillize);
      circle(int(random(tree.width)), int(random(tree.height)), pointillize);
    }
  }
}

/*References:
https://processing.org/tutorials/pixels/
https://www.kindpng.com/imgv/iRJhR_tree-png-image-tree-png-for-photoshop-transparent/
*/
