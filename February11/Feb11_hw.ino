int pushButton = 8; /*blue button*/

void setup() {
  Serial.begin(9600);
  // make the pushbutton's pin an input:
  pinMode(pushButton, INPUT);
  // make the LEDs outputs
  pinMode(3, OUTPUT);
  pinMode(4, OUTPUT);
  pinMode(5, OUTPUT);
  pinMode(6, OUTPUT);
}

void loop() {
  int buttonState = digitalRead(pushButton);

  // constantly randomly generate a number between 3 and 6, in which each number
  // is connected to each of the four LEDs
  int randomNumber = random(3, 7); //maximum (7) is exclusive

  // make the LED (chosen from the random number generater) blink for 0.1sec
  if (buttonState == 1) {
    digitalWrite(randomNumber, HIGH);
    delay(100);
    digitalWrite(randomNumber, LOW);
    delay(100);
  }

  // if the switch is not on, turn off all LEDs
  else {
    digitalWrite(3, LOW);
    digitalWrite(4, LOW);
    digitalWrite(5, LOW);
    digitalWrite(6, LOW);
  }
  // print out the state of the button:
  Serial.println(buttonState);
  delay(1);        // delay in between reads for stability
}
