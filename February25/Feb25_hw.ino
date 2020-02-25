//reference: "servo knob" example code, "toneMelody" example code, and pitches.h

#include <Servo.h>
Servo myservo;  // create servo object to control a servo

#include "pitches.h" // reference pitches.h file

const int switch1 = 5; // happy switch (yellow) to 5
const int switch2 = 6; // sad switch (blue) to 6
const int slideswitch = 7; // slide switch to 7
const int buzzer = 8; //  buzzer to 8
const int servo = 9; // servo to 9

//happy song: "Ode to Joy" by Beethoven//

int happymelody[] = {
  NOTE_E4, NOTE_E4, NOTE_F4, NOTE_G4, NOTE_G4, NOTE_F4, NOTE_E4, NOTE_D4,
  NOTE_C4, NOTE_C4, NOTE_D4, NOTE_E4, NOTE_E4, NOTE_D4, NOTE_D4,
  NOTE_E4, NOTE_E4, NOTE_F4, NOTE_G4, NOTE_G4, NOTE_F4, NOTE_E4, NOTE_D4,
  NOTE_C4, NOTE_C4, NOTE_D4, NOTE_E4, NOTE_D4, NOTE_C4, NOTE_C4,
};

int happynoteDurations[] = {
  4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 2, 8, 2,
  4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 2, 8, 2
};

//sad song: "Swan Lake" by Tchaikovsky//

int sadmelody[] = {
  NOTE_E4, NOTE_A3, NOTE_B3, NOTE_C4, NOTE_D4, NOTE_E4, 0, NOTE_C4, NOTE_E4, 0, NOTE_C4, 
  NOTE_E4, 0, NOTE_A3, NOTE_C4, NOTE_A3, NOTE_F3, NOTE_C4, NOTE_A3
};

int sadnoteDurations[] = {
  1, 4, 4, 4, 4, 2, 4, 4, 2, 4, 4, 
  2, 4, 4, 4, 4, 4, 4, 1
};

void setup() {
  Serial.begin(9600);
  pinMode(switch1, INPUT);
  pinMode(switch2, INPUT);
  pinMode(slideswitch, INPUT);
  myservo.attach(servo);  // attaches the servo on pin 9 to the servo object
}

void loop() {
  int buttonState = digitalRead(switch1);
  int buttonState2 = digitalRead(switch2);
  int slideState = digitalRead(slideswitch);

  //when the slide switch is turned on, start the orchestra
  if (slideState == 1) {

    if (buttonState == 1) {
      //move the servo so that the happy face is on the front (0 degrees)
      myservo.write(0);
      delay(20);

      //play "Ode to Joy" (happy song)
      for (int thisNote = 0; thisNote < 30; thisNote++) {

        // to calculate the note duration, take one second divided by the note type.
        int happynoteDuration = 1000 / happynoteDurations[thisNote];
        tone(buzzer, happymelody[thisNote], happynoteDuration);

        // to distinguish the notes, set a minimum time between them. 
        //the note's duration + 30% seems to work well:
        int pauseBetweenNotes = happynoteDuration * 1.30;
        delay(pauseBetweenNotes);
        
        // stop the tone playing:
        noTone(buzzer);
      }
    }


    // when the sad blue switch is turned on...
    else if (buttonState2 == 1) {
      //move the servo so that the sad face is on the front (180 degrees)
      myservo.write(180);
      delay(20);
      
      //play "Swan Lake" (sad song)
      for (int thisNote = 0; thisNote < 19; thisNote++) {

        int sadnoteDuration = 1000 / sadnoteDurations[thisNote];
        tone(buzzer, sadmelody[thisNote], sadnoteDuration);

        int pauseBetweenNotes = sadnoteDuration * 1.30;
        delay(pauseBetweenNotes);
        noTone(buzzer);
      }
    }

  }

  //when the slide switch is off, move the ball so that it doesn't show two faces
  //and not make sound
  else {
    myservo.write(90); 
    delay(20);
    noTone(buzzer);
  }

}
