class ArduinoConnector
  def initialize(arduino)
    @arduino = arduino
    @arduino.add_listener(self)
  end
  
  def receive_message(input, output)
    nil
  end

  def send_message(msg)
    @arduino.send(msg)
  end
  
end

class ArduinoConnectorException < Exception; end;