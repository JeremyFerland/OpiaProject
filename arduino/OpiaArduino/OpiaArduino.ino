int pinPot1 = 2;
int pinPot2 = 3;
int pinHall1 = 2;

void setup() {
  // put your setup code here, to run once:
  Serial.begin(57600);
  pinMode(pinHall1,INPUT);
}

void loop() {
  // put your main code here, to run repeatedly:
  printAnalogVal(pinPot1, "pinPot1");
  printAnalogVal(pinPot2, "pinPot2");
  printDigitalVal(pinHall1, "pinHall1");
  delay(100);
}

void printAnalogVal(int nbCapteur, String prefix){
  int val = analogRead(nbCapteur);
  Serial.print(prefix);
  Serial.print(" ");
  Serial.print(val);
  Serial.println();
}

void printDigitalVal(int nbCapteur, String prefix){
  int val = digitalRead(nbCapteur);
  Serial.print(prefix);
  Serial.print(" ");
  Serial.print(val);
  Serial.println();
}
