## Arduino ##
This gem makes it simple to connect to an Arduino board using Ruby.

Arduino is a wonderful little platform that includes a microcontroller, digital I/O, analog input, power, serial communication, and a great community. You can learn more about Arduino at http://arduino.cc.

## Why connect Arduino to your computer? ##
You can create standalone projects with Arduino using the provided IDE, but for some applications or quick prototypes it is convenient to connect the board to a computer.

- Control things on your computer with sensors connected to Arduino.
- Use your keyboard to send commands to your Arduino.
- Store data on you computer. Instead of using Arduino's 1KB of flash memory or buying a compatible SD card reader, record data you collect on your giant hard disk.
- Connect your Arduino to the world more easily. Instead of using an ethernet shield and dealing with networking on the Arduino board itself, just write Ruby and use libraries like openuri.

## Usage ##
	require 'arduino'
	port = '/dev/tty.usbserial-A7006AkP' # Depending on what port your device is connected to
	arduino = Arduino::Board.new(:port => port)
	arduino.connect
	arduino.send("hello")