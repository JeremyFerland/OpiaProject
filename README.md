# OpiaProject

## Descrption

The Processing code displays a playground viewed from top with 3 characters facing each other. The user can rotate the view for 2 of the 3 character. If the 3rd person is being looked at, the color of the 3rd one changes and the oscillation gets faster. The communication system is based on OSC with an imported library into Processing (oscP5). (http://www.sojamo.de/libraries/oscP5)

The Arduino code sends data into the serial to control the interactive video projection made in Processing.

The Max MSP code does all the linking needed to communicate between the applications. Bonus point, it also runs a simple synth to create some musical tention depending of the inteaction.


## Hardware needed

- Arduino Leonardo (or Uno)
- 2 x 10k potentiometers (https://www.adafruit.com/products/562)
- 1 x hall sensor (https://www.adafruit.com/products/158)

## Software required

- Max MSP
- Processing
- Arduino

## How to use

To do...