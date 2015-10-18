class LookAt {

  int lowWideRangeValue, maxWideRangeValue, lowCloseRangeValue, maxCloseRangeValue;

  float targetSize;
  float sinTarget;
  float targetFactor;
  color targetColor;

  LookAt() {
    
    targetSize = 50;
    targetFactor = 70;
    targetColor = color(255, 200);
  }

  void display(int control, int lowWideRangeValue, int maxWideRangeValue, int lowCloseRangeValue, int maxCloseRangeValue) {

    targetSize = (sin(sinTarget)*5)+targetFactor;

    if ((control >= lowWideRangeValue && control <= maxWideRangeValue) && (control >= lowCloseRangeValue || control <= maxCloseRangeValue)) {
      red  = constrain(redValue, 127, 255);
      redValue = red-1;
      targetColor = color(255, redValue, redValue);
      sinTarget+=0.08;
    } else if (control <= lowCloseRangeValue && control >= maxCloseRangeValue) {
      red  = constrain(redValue, 0, 255);
      redValue = red-1;
      targetColor = color(255, redValue, redValue); 
      sinTarget+=0.5;
    } else {
      red  = constrain(redValue, 0, 255);
      redValue = red+1;
      targetColor = color(255, redValue, redValue);
      sinTarget+=0.05;
    }
  }
}