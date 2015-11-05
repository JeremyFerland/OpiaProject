# OpiaProject

## Descrption

The project Opia was designed to represent interactively the feeling of Opia : a non-existent word defining the feeling of invasion when somebody looks at us in the eyes. 

Trying to represent that, we used Processing to project the visuals on a table, Arduino to interact with the interactive installation and Max MSP to create a reactive audio content.

The Processing code displays a playground viewed from top with 3 characters facing each other. The user can rotate the view for 2 of the 3 characters. The more the 3rd person is being looked at, the more his color gets red and the oscillation faster. The communication system is based on OSC with an imported library into Processing ([oscP5](http://www.sojamo.de/libraries/oscP5))

The Arduino code sends data from the sensors to the serial where MAX MSP collects the data.

Max MSP recieves the serial communication to convert into OSC packets needed to communicate between the applications. It also runs a synth to create a musical tention reaction from the inteaction.


## Video


"[Project Opia](https://www.youtube.com/embed/0o8mw5g3wG8)"

## Hardware needed
- 1 Arduino Leonardo and a usb A to B cable
- 2 x 10k potentiometers (https://www.adafruit.com/products/562)
- 1 x hall sensor (https://www.adafruit.com/products/158)
- 1 x 10k resistance
- Some 10 AWG cables

## Software required
- Processing (v2.0 or later)
- Arduino (v1.5 or later)
- Max MSP (v6.1 or later)

## How to use
**The "as is" way**

1. Connect all the sensors as indicated [here](https://github.com/JeremyFerland/OpiaProject/blob/master/Documentation/PlanBranchementsPhysique_Opia.jpg).

2. Connect the Arduino with the usb cable and transfer the [code](https://github.com/JeremyFerland/OpiaProject/blob/master/arduino/OpiaArduino/OpiaArduino.ino).

3. Open the MAX file '[opia.maxpat](https://github.com/JeremyFerland/OpiaProject/blob/master/max%20msp/Opia.maxpat)'.

4. In presentation mode, select the serial port of your Arduino. Hit refresh if it's not in the list. Otherwize, your computer didn't detect the device.

5. Then, activate the "on/off" button and press the speaker icon to let the sound go through your speakers.

6. Open the Processing principal [code](https://github.com/JeremyFerland/OpiaProject/blob/master/processing/opiaProcessing/opiaProcessing.pde).

7. Hit Run (or play) into the Processing app.

8. Enjoy ! By rotating the potentiometers, the display ans the sound should respond to your commands.

**DEBUG NOTE : Only one serial monitor at the time in your computer can be open in order to work.**