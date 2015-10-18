class VisionRange {

  int dotSize;
  color dotColor, dotOpacity;
  color wideRangeColor, closeRangeColor;

  int control;
  int posX, posY;
  int lowWideRangeValue, maxWideRangeValue, lowCloseRangeValue, maxCloseRangeValue;
  boolean hall;

  VisionRange(int temp_posX, int temp_posY, int temp_lowWideRangeValue, int temp_maxWideRangeValue, int temp_lowCloseRangeValue, int temp_maxCloseRangeValue) {

    posX = temp_posX;
    posY = temp_posY;

    lowWideRangeValue = temp_lowWideRangeValue; 
    maxWideRangeValue = temp_maxWideRangeValue;
    lowCloseRangeValue = temp_lowCloseRangeValue; 
    maxCloseRangeValue = temp_maxCloseRangeValue;

    dotSize = 50;
    dotOpacity = 120;
    dotColor = color(255, dotOpacity);
    wideRangeColor = color(#FFC500, 60);
    closeRangeColor = color(#FF7100, 80);
  }


  void display(int temp_control, boolean temp_hall) {

    control = temp_control;
    hall = temp_hall;
    // NOTES: 
    // haut = -95 to - 128 // close range  -108 to -115
    // bas = -80 to -52 // close range -62 to -70

    pushMatrix();
    translate(posX, posY);
    rotate(radians(control));
    fill(closeRangeColor);
    arc(0, 0, 1500, 1500, radians(268), radians(272));
    fill(wideRangeColor);
    arc(0, 0, 1500, 1500, radians(260), radians(268));
    arc(0, 0, 1500, 1500, radians(272), radians(280));
    fill(dotColor);
    ellipse(0, 0, dotSize, dotSize);
    popMatrix();
  }

  int state() {

    if (control > lowCloseRangeValue && control < maxCloseRangeValue) {
      //println("2");
      return 2;
    } else if (control > lowWideRangeValue && control < maxWideRangeValue) {
      //println("1");
      return 1;
    } else {
      //println("0");
      return 0;
    }
  }
}