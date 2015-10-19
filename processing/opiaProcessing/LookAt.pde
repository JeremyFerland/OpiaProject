/* 
 
 Created by Marc-Olivier Héroux-Hould & Jérémy Ferland ©2015 V1.0
 Created on October 14, 2015
 Processing V3.0
 
 Description : This code displays a playground viewed from top with 3 persons facing each other. The user can change the
   rotation of the view for 2 out of those 3. If the 3rd person is being looked at, the color changes and the oscillation gets
   faster of smaller. The communication system is based on OSC with an imported library (oscP5). (http://www.sojamo.de/libraries/oscP5)
 
 Licence : This work is licensed under the Creative Commons Attribution-NonCommercial 4.0 International License.
 
 Title : Opia
 
 */

class LookAt {

  // State of the target variable
  int state;
  boolean hall;
  // Target reactions variable
  float targetSize;
  float sinTarget;
  float targetFactor;
  color targetColor, targetOpacity;
  int red, redValue;

  // LookAt constructor
  LookAt() {

    hall = false;
    targetSize = 100;
    targetFactor = 100;
    targetOpacity = 255;
    redValue = 255;
    targetColor = color(255, 255, 255, targetOpacity);
  }

  void display() {
    // Oscillate a little the target
    targetSize = (sin(sinTarget)*10)+targetFactor;

    if (hall == true || state == 0) {
      redValue = redValue+1;
      targetColor = color(255, redValue, redValue, targetOpacity);
      sinTarget+=0.02;
    } 
    
    else if (state == 4 ) {
      redValue = redValue-1;
      red  = constrain(redValue, 0, 255);
      redValue = red;
      targetColor = color(255, redValue, redValue, targetOpacity);
      sinTarget+=0.5;
    } 
    
    else if ( state == 3) {
      redValue = redValue-1;
      red  = constrain(redValue, 0, 255);
      redValue = red;
      targetColor = color(255, redValue, redValue, targetOpacity);
      sinTarget+=0.1;
    } 
    
    else if (state == 2) {
      redValue = redValue-1;
      red  = constrain(redValue, 127, 255);
      redValue = red;
      targetColor = color(255, redValue, redValue, targetOpacity);
      sinTarget+=0.05;
    } 
    
    else if (state == 1) {
      redValue = redValue-1;
      red  = constrain(redValue, 200, 255);
      redValue = red;
      targetColor = color(255, redValue, redValue, targetOpacity);
      sinTarget+=0.03;
    }
    
    fill(targetColor);
    ellipse(350, height/2, lookAt.targetSize, lookAt.targetSize);
    
  }

  void setState(int temp_state) {
    state = temp_state;
    //println(state);
  }
  
  void setHall(boolean temp_hall) {
    hall = temp_hall;
  }
  
}