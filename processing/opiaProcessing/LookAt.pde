class LookAt {

  int state;
  float targetSize;
  float sinTarget;
  float targetFactor;
  color targetColor, targetOpacity;
  boolean hall;

  LookAt() {

    hall = false;
    targetSize = 50;
    targetFactor = 70;
    targetOpacity = 170;
    targetColor = color(255, 0, 0, targetOpacity);
  }

  void display() {

    targetSize = (sin(sinTarget)*5)+targetFactor;
    if (hall == true || state == 0) {
    } else if (state == 4 ) {
      red  = constrain(redValue, 127, 255);
      redValue = red-1;
      targetColor = color(255, redValue, redValue, targetOpacity);
      sinTarget+=0.08;
    } else if ( state == 3) {
      red  = constrain(redValue, 0, 255);
      redValue = red+1;
      targetColor = color(255, redValue, redValue, targetOpacity);
      sinTarget+=0.05;
    } else if (state == 2) {
      red  = constrain(redValue, 0, 255);
      redValue = red-1;
      targetColor = color(255, redValue, redValue, targetOpacity); 
      sinTarget+=0.5;
    } else {
      redValue = red-1;
    }
  }

  void setState(int newState) {

    state = newState;
    println(state);
  }
  void setHall(boolean temp_hall) {
    hall = temp_hall;
  }
}