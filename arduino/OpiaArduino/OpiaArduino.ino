// Created by Jérémy Ferland & Marc-Olivier Héroux-Hould ©2015 V1.0
// Created on October 16, 2015
// Arduino V1.6.5-r5

// Licence : This work is licensed under the Creative Commons Attribution-NonCommercial 4.0 International License.

// Title : Opia

//-----------------------------------//

// Analog input
int pinPot1 = 2;
int pinPot2 = 3;

// Digital Input
int pinHall1 = 2;

//-----------------------------------//
void setup() {
  // Sets the serial to 57600 bauds
  Serial.begin(57600);
  // Read data from the Hall sensor (see: https://www.adafruit.com/products/158)
  pinMode(pinHall1, INPUT);
}

//-----------------------------------//
void loop() {
  // Print potentiometer #1
  printAnalogVal(pinPot1, "pinPot1");
  // Print potentiometer #2
  printAnalogVal(pinPot2, "pinPot2");
  // Print hall sensor #1
  printDigitalVal(pinHall1, "pinHall1");
  
  delay(100);
}

//-----------------------------------//
// Analog print function 
void printAnalogVal(int nbCapteur, String prefix) {
  int val = analogRead(nbCapteur);
  Serial.print(prefix);
  Serial.print(" ");
  Serial.print(val);
  Serial.println();
}

//-----------------------------------//
// Digital sensor print function 
void printDigitalVal(int nbCapteur, String prefix) {
  int val = digitalRead(nbCapteur);
  Serial.print(prefix);
  Serial.print(" ");
  Serial.print(val);
  Serial.println();
}
