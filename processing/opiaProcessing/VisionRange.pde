/* 
 
 Created by Marc-Olivier Héroux-Hould & Jérémy Ferland ©2015 V1.0
 Created on October 14, 2015
 Processing V3.0
 
 Licence : This work is licensed under the Creative Commons Attribution-NonCommercial 4.0 International License.
 
 Title : Opia
 
 */
 
class VisionRange {

  // Variable for the dot
  int posX, posY;
  int dotSize;
  color dotColor;

  // Variavle for the arc
  int arcLenght, arcLenghtValue;
  color wideRangeColor, closeRangeColor;

  // Variable for the control input value
  int control;
  // Variable for reactions of the dot from the arc position
  int lowWideRangeValue, maxWideRangeValue, lowCloseRangeValue, maxCloseRangeValue;
  // Variable for the hall state
  boolean hall;

  // VisionRange constructor
  VisionRange(int temp_posX, int temp_posY, int temp_lowWideRangeValue, int temp_maxWideRangeValue, int temp_lowCloseRangeValue, int temp_maxCloseRangeValue) {

    // Dot values
    dotSize = 100;
    dotColor = color(255);

    // Position of the dot where the arc starts
    posX = temp_posX;
    posY = temp_posY;

    // Value to react the dot from the arc
    lowWideRangeValue = temp_lowWideRangeValue; 
    maxWideRangeValue = temp_maxWideRangeValue;
    lowCloseRangeValue = temp_lowCloseRangeValue; 
    maxCloseRangeValue = temp_maxCloseRangeValue;

    // Arc lenght from hall state
    arcLenghtValue = 1500;   
    // Range color values
    wideRangeColor = color(#FFC500, 60);
    closeRangeColor = color(#FF7100, 80);
  }

  void display(int temp_control, boolean temp_hall) {

    // Values of the sensors
    control = temp_control;
    hall = temp_hall;

    // Arc lenght gets smaller as the hall turn true;
    arcLenght = constrain(arcLenghtValue, 800, 1500);
    if (hall == true) {
      arcLenghtValue = arcLenght;
      arcLenghtValue -=2;
      //println("arcLenght = "+arcLenght);
    } else { // Arc lenght gets longer as the hall turn false;
      arcLenghtValue = arcLenght;
      arcLenghtValue +=2;
      //println("arcLenght = "+arcLenghtValue );
    }

    // Displaying the arc
    pushMatrix();
    // Move if to its position in the map
    translate(posX, posY);
    // Rotate it from the sensor value
    rotate(radians(control));
    // Display close range
    fill(closeRangeColor);
    arc(0, 0, arcLenght, arcLenght, radians(268), radians(272));
    // Display wide range
    fill(wideRangeColor);
    arc(0, 0, arcLenght, arcLenght, radians(260), radians(268));
    arc(0, 0, arcLenght, arcLenght, radians(272), radians(280));
    // Display the dot as a starting point
    fill(dotColor);
    ellipse(0, 0, dotSize, dotSize);
    popMatrix();
  }

  int state() {

    // If is in the close range
    if (control > lowCloseRangeValue && control < maxCloseRangeValue) {
      //println("2");
      return 2;
    } // If is in the wide range
    else if (control > lowWideRangeValue && control < maxWideRangeValue) {
      //println("1");
      return 1;
    } else { // Everything else out of bounds
      //println("0");
      return 0;
    }
  }
}