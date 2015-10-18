class VisionRange {

  int dotSize;
  color dotColor;
  color wideRangeColor, closeRangeColor;

  VisionRange() {
    dotSize = 50;
    dotColor = color(255, 200);
    wideRangeColor = color(#FFC500, 60);
    closeRangeColor = color(#FF7100, 80);
  }


  void display(int posX, int posY, int control) {

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
}