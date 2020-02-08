**Random LED Blinks**

**[Link to Video](https://youtu.be/TBH0HIdpNPA)**

My program makes each of the four LEDs in the circuit randomly blink when the switch button is pushed. 
To explain further, each LED is connected to a digital pin with a number ranging from 3 to 6. In accordance to this, the program constantly generates a random number between 3 and 6 using the random() function. And, when the switch button is pushed, the LED pin whose number equals the randomly generated number blinks. The LED that blinks changes every 0.2sec based on the new random numbers generated.

**Schematic**
![](Feb11_schematic.png)

**Program**
![](programscreenshot.jpg)

**Set-Up**
![](Setup.jpg")

Reference:
- https://www.arduino.cc/reference/en/language/functions/random-numbers/random/
