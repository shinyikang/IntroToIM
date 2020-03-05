#include <Servo.h>
Servo myservo1;  // create two servo objects
Servo myservo2;

#include "pitches.h" // reference pitches.h file for melody

const int slideSwitch = 4; // slideswitch to 4
const int servo1 = 3; // servo 1 to 3
const int servo2 = 12; // servo 2 to 12
const int buzzer = 11; //  buzzer to 11
const int led1 = 6; // leds to 6-8
const int led2 = 7;
const int led3 = 8;
const int forceS = A0; // force resistive sensor to A0
byte tunePlayed; // boolean variable used to make the melody play only once when the bag closes

//short happy melody

int happymelody[] = {
  NOTE_G4, NOTE_G4, NOTE_F4, NOTE_A4, NOTE_G4, NOTE_B4, NOTE_A4, NOTE_G4,
  NOTE_F4, NOTE_D4, NOTE_C4
};

int happynoteDurations[] = {
  4, 4, 8, 8, 4, 8, 8, 8, 8, 4, 2
};

void setup() {
  Serial.begin(9600);
  pinMode(slideSwitch, INPUT);
  pinMode(forceS, INPUT);
  pinMode(led1, OUTPUT);
  pinMode(led2, OUTPUT);
  pinMode(led3, OUTPUT);
  pinMode(buzzer, OUTPUT);
  myservo1.attach(servo1);
  myservo2.attach(servo2);
}

void loop() {

  int switchState = digitalRead(slideSwitch);
  int fsrReading = analogRead(forceS);

  //print the detected values for FSR
  Serial.print("Force Sensor Analog Reading = ");
  Serial.println(fsrReading);
  delay(5);

  // if the slide switch is on...
  if (switchState == 1) {

    //LEDs light up
    digitalWrite(led1, HIGH);
    digitalWrite(led2, HIGH);
    digitalWrite(led3, HIGH);

    //servos rotate 180 degrees back and forth
    myservo1.write(180);
    myservo2.write(180);
    delay(500);
    myservo1.write(0);
    myservo2.write(0);
    delay(500);

    // if the fsrReading is greater than 600 (bag is closed) & the melody has not yet played...
    if (!tunePlayed & fsrReading >= 600) { // 600 was chosen based on the fsrReading values
      for (int thisNote = 0; thisNote < 11; thisNote++) {

        // mark that the melody has played
        tunePlayed = true;

        // sing the short happy melody
        //note: I increased the duration from 1sec to 1.5sec so that the melody is a bit slower
        int happynoteDuration = 1500 / happynoteDurations[thisNote];
        tone(buzzer, happymelody[thisNote], happynoteDuration);

        // to distinguish the notes, set a minimum time between them.
        int pauseBetweenNotes = happynoteDuration * 1.30;
        delay(pauseBetweenNotes);

        // stop the tone playing:
        noTone(buzzer);
      }
    }

    // if the fsrReading is less than 600...
    else if (fsrReading < 600) {

      // mark that the melody has not played yet
      tunePlayed = false;

      // tone does not play
      noTone(buzzer);
    }

  }

  // if the slide switch is off...
  else {
    //turn of all LEDs and the buzzer
    digitalWrite(led1, LOW);
    digitalWrite(led2, LOW);
    digitalWrite(led3, LOW);
    noTone(buzzer);
  }

}

//REFERENCE
// https://www.fiverr.com/peter_s_price/harmonise-a-simple-short-melody for the short happy melody
// https://forum.arduino.cc/index.php?topic=240006.0 to make the melody play only once after the 
//condition is satisfied
// example code "toneMelody" for making the bag sing
// example code servo "sweep" for making the eyes/servos rotate
