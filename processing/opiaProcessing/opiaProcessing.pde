/* 
 
 Created by Marc-Olivier Héroux-Hould & Jérémy Ferland ©2015 V1.0
 Created on October 14, 2015
 Processing V3.0
 
 Licence : This work is licensed under the Creative Commons Attribution-NonCommercial 4.0 International License.
 
 Title : Opia
 
 */

// Background image variable
PImage groundBg;

// VisionRange class
VisionRange visionRange1, visionRange2;
int visionRangeCount;

// LookAt class
LookAt lookAt;

// import oscP5 library
import netP5.*;
import oscP5.*;

// oscP5 variables
OscP5 oscP5;
NetAddress myRemoteLocation;

// Sensors
int p1;
int p2;
boolean h1;

void setup() {
  // **Made for VGA displays**
  // size(1024, 768);
  fullScreen(1);

  // Start oscP5, listening for incoming messages at port 7400
  oscP5 = new OscP5(this, 7400);

  // myRemoteLocation needs 2 things : IP location and a port to listen from
  myRemoteLocation = new NetAddress("127.0.0.1", 7400);

  // Start from black screen
  background(0);
  // Load background image
  groundBg = loadImage("grass.png");

  // No outlines at all
  noStroke();

  // Create 2 visionRange with their own position and range values
  visionRange1 = new VisionRange(width - width/8, height/8, -130, -105, -120, -115);
  visionRange2 = new VisionRange(width - width/8, height - height/8, -75, -50, -70, -60);
  // Variable to display in llop for
  visionRangeCount = 2;

  // Create a target
  lookAt = new LookAt();

  // Starting degree of VisionRange facing left of the screen
  p1 = -90;
  p2 = -90;
}

void draw() {
  // Refresh every frame from black
  background(0);
  //Show background image
  image(groundBg, 0, 0);

  // Display visionRange 1 & 2
  for (int i = 0; i < visionRangeCount; i++) {
    visionRange1.display(p1, h1);
    visionRange2.display(p2, h1);
  }

  // Set state for visionRange 1 & 2
  lookAt.setState(visionRange1.state()+visionRange2.state());
  // Set state for hall sensor
  lookAt.setHall(h1);
  // Display target
  lookAt.display();
}

// Incoming osc message are forwarded to the oscEvent method
void oscEvent(OscMessage theOscMessage) {
  // Print the address pattern and the typetag of the received OscMessage
  if (theOscMessage.addrPattern().equals("/P1")) {
    p1 = theOscMessage.get(0).intValue();
    p1 = (int)map(p1, 0, 1023, 0, -180);
    //   println("P1 value = "+p1);
  }
  if (theOscMessage.addrPattern().equals("/P2")) {
    p2 = theOscMessage.get(0).intValue();
    p2 = (int)map(p2, 0, 1023, 0, -180);
    //   println("P2 value = "+p2);
  }
  if (theOscMessage.addrPattern().equals("/H1")) {
    h1 = boolean(theOscMessage.get(0).intValue());
    //println("H1 value = "+h1);
  }
  //print("### Received an osc message :");
  //print(" addrpattern: "+theOscMessage.addrPattern());
  //println(" val: "+theOscMessage.get(0).intValue());
}