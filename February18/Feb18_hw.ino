int slideSwitch = 8;
int led1 = 7;
int led2 = 6;
int buzzer = 5;
int photoResistor = A1;

void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
  pinMode(photoResistor, INPUT);
  pinMode(slideSwitch, INPUT);
  pinMode(led1, OUTPUT);
  pinMode(led2, OUTPUT);
  pinMode(buzzer, OUTPUT);
}

void loop() {
  int switchState = digitalRead(slideSwitch);
  int photoResistorReading = analogRead(photoResistor);

  //print the photoresistor sensor values
  Serial.println(photoResistorReading);
  delay(1);

//when the light switch is turned on, turn on the green LED. if the "room" is still dark,
//red LED also lights up.
  if (switchState == 1) {
    digitalWrite(led1, HIGH);
    if (photoResistorReading < 600) {
      digitalWrite(led2, HIGH);
    }
    else {
      digitalWrite(led2, LOW);
    }

  }

//when the light switch is off, the "room" turns into a horror house, with the loud beeping
//noise from the buzzer. Make the beeping noise faster as the "room" gets darker.
  else {
    digitalWrite(led1, LOW);
    digitalWrite(led2, LOW);
    tone(buzzer, 1400);
    delay(photoResistorReading);
    noTone(buzzer);
    delay(photoResistorReading);
  }

}
