/* 
 
 Created by Marc-Olivier Héroux-Hould & Jérémy Ferland ©2015 V1.0
 Created on October 14, 2015
 Processing V3.0
 
 Description : This patch recieves OSC message thru the serial.
 Licence : This work is licensed under the Creative Commons Attribution-NonCommercial 4.0 International License.
 
 */

PImage groundBg;

VisionRange visionRange1, visionRange2;
int visionRangeCount;

LookAt lookAt;

import netP5.*;
import oscP5.*;

OscP5 oscP5;
NetAddress myRemoteLocation;

int p1;
int p2;
boolean h1;
float target;
float sinTarget;
float targetFactor, targetFactorValue;
color targetColor;
int red, redValue;


void setup() {
  // size(1024, 768);
  fullScreen(1);

  // Start oscP5, listening for incoming messages at port 7400
  oscP5 = new OscP5(this, 7400);

  // myRemoteLocation needs 2 things : IP location and a port to listen from
  myRemoteLocation = new NetAddress("127.0.0.1", 7400);

  background(0);
  groundBg = loadImage("grass.png");

  noStroke();

  visionRange1 = new VisionRange(width - width/8, height/8,-130, -105, -122, -115);
  visionRange2 = new VisionRange(width - width/8, height - height/8, -75, -50, -70, -60);
  
  visionRangeCount = 2;

  lookAt = new LookAt();

  // Starting degree facing left of the screen
  p1 = -90;
  p2 = -90;
}

void draw() {
  background(0);
  image(groundBg, 0, 0);

  for (int i = 0; i < visionRangeCount; i++) {
    visionRange1.display(p1,h1);
    visionRange2.display(p2,h1);
  }

  lookAt.setState(visionRange1.state()+visionRange2.state());
  lookAt.setHall(h1);
  lookAt.display();

  fill(lookAt.targetColor);
  ellipse(350, height/2, lookAt.targetSize, lookAt.targetSize);

  //println("p1 = "+p1);
  //println("p2 = "+p2);
  
}

/* incoming osc message are forwarded to the oscEvent method. */
void oscEvent(OscMessage theOscMessage) {
  /* print the address pattern and the typetag of the received OscMessage */
  if (theOscMessage.addrPattern().equals("/P1")) {
    p1 = theOscMessage.get(0).intValue();
    p1 = (int)map(p1, 0, 1023, 0, -180);
    //   println(p1);
  }
  if (theOscMessage.addrPattern().equals("/P2")) {
    p2 = theOscMessage.get(0).intValue();
    p2 = (int)map(p2, 0, 1023, 0, -180);
    //   println(p2);
  }

  //print("### Received an osc message :");
  //print(" addrpattern: "+theOscMessage.addrPattern());
  //println(" val: "+theOscMessage.get(0).intValue());
}