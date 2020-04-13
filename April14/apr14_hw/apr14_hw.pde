//Amy Kang
//April 14, Intro to Interactive Media
//Generative Text

/* Overall Concept & Instructions:
My program generates varying version of a pen pal letter whenever the code runs. 
The user gets the letter by writing down his/her name on the opening page and pressing 
enter. The name written down becomes the receiver, and several words/phrases of the 
letter are determined randomly based on the different options listed in the table in the
.csv file. 
The layout of the letter is the following:

Dear __user-input name__,

Greetings from __country__!
My name is __sender__, and I am so excited to exchange letters with you as pen pals. Things seem to be really hectic these days, so I hope you're coping with whatever is going on.
Going off on a tangent, I just had __food__, and I'm so full that I can't breathe.
I'll soon head off to __activity__. 
You can probably guess how I feel about that :)
Although I have to leave now, I'd love to learn more about you!
__question__.
Meanwhile, take care, and hope you get back to me soon!

Your pen pal,
__sender__

*/


//the list of texts is in the form of a csv file (table)
Table table;
//font variable
PFont font;
//whether input is entered or not
boolean input = false;
//input for the user's name
String name="";
//random text variables
String country_c;
String food_c;
String activity_c;
String question_c;
String sender_c;

void setup() {
  background(255);
  size(700,700);
  
  //Main reference: https://github.com/paredesfluffyshark/Intro-To-IM/tree/master/Text-Generator
  
  table = loadTable("generateText.csv", "header"); //load csv file
  
  // Each fill-in-the-blank has its own list in the .csv file based on the columns
  String country[] = table.getStringColumn("Country");
  String food[] = table.getStringColumn("Food");
  String activity[] = table.getStringColumn("Activity");
  String question[] = table.getStringColumn("Question");
  String sender[] = table.getStringColumn("Sender");
  
  //use font Georgia, size 20
  font = loadFont("Georgia-Italic-20.vlw");
  textFont(font, 20);
  
  //Randomly choose a string from the list for all of the fill-in-the-blanks
  country_c = country[int(random(0,8))];
  food_c = food[int(random(0,8))];
  activity_c = activity[int(random(0,8))];
  question_c = question[int(random(0,8))];
  sender_c = sender[int(random(0,8))];
  
}

void draw() {
  
  background(255);
  
  //if "enter" has not been pressed yet...
  if (!input) {
    textAlign(CENTER);
    mail(300,250); //the closed mail icon is displayed
    stroke(0);
    fill(0);
    text ("What is your name? \n"+name, 350, 350); //the user is asked to input his/her name and press enter
  }
  //when the "enter" button is pressed...
  else {
    textAlign(LEFT);
    background(255);
    mail(300,80);
    fill(0);
    //display the letter with the user-input name as well as the randomly chosen fill-in-the-blank words/phrases.
    text("Dear "+name+",",30,200);
    text("\n\nGreetings from "+country_c+
    "!\nMy name is "+sender_c+", and I am so excited to exchange letters \nwith you as pen pals."+
    " Things seem to be really hectic these days,\nso I hope you're coping with whatever is going on."+
    "\nGoing off on a tangent, I just had "+food_c+", and I'm so \nfull that I can't breathe."+
    "\nI'll soon head off to "+activity_c+".\nYou can probably guess how I feel about that :)"+
    "\nAlthough I have to leave now, I'd love to learn more about you!\n"+question_c+
    "\nMeanwhile, take care, and hope you get back to me soon!"+
    "\n\nYour pen pal,\n"+sender_c
    ,30,200);
  }
  
}

//main reference: https://forum.processing.org/two/discussion/20882/very-basic-question-how-to-create-an-input-text-box
//used a boolean variable to determine whether "enter" has been pressed or not, different to the reference above
void keyPressed() {
  if (key==ENTER) {
    input = true;
  }
  else {
    name = name+key;
  }
}

//mail icon variable
void mail(int x, int y) { //x is x-location and y is y-location
  fill(255);
  stroke(0);
  strokeWeight(2);
  pushMatrix();
  translate(x,y); //translate
  rect(0,0,100,50); 
  triangle(0,0,100,0,50,30); //(by default) in the opening page, the mail icon is closed
  if (input) { //in the letter page, make it so that it is an opened mail icon
    triangle(0,0,100,0,50,-30);
    rect(15,-20,70,20);
    stroke(255);
    strokeWeight(3);
    line(3,0,97,0);
  }
  popMatrix();
}

/*References:
- https://wp.nyu.edu/abudhabi_im_intro/meeting-18-week-9-long-day-thursday-april-9-240-520/
- https://github.com/paredesfluffyshark/Intro-To-IM/tree/master/Text-Generator
- https://forum.processing.org/two/discussion/20882/very-basic-question-how-to-create-an-input-text-box
*/
