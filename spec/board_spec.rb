require 'spec/spec_helper'

describe Arduino::Board do
  describe "#new" do
    it "should require a port" do
      lambda { Arduino::Board.new }.should raise_error
    end
    
    it "should override default options with given options" do
      overrides = {
        :baud_rate => 999,
        :data_bits => 998,
        :stop_bits => 997,
        :parity => SerialPort::NONE
      }
      options = overrides.merge :port => '/dev/tty.usbserial-A7006SoU'        
      mock(SerialPort).new(options[:port], hash_including(overrides))
      arduino = Arduino::Board.new options      
    end
    
    it "open a connection to the specified serial port with the default options" do
      port = '/dev/tty.usbserial-A7006SoU'
      mock(SerialPort).new(
        port, 
        hash_including(
          :baud_rate => 9600,
          :data_bits => 8,
          :stop_bits => 1,
          :parity => SerialPort::NONE
        )
      )
      arduino = Arduino::Board.new(:port => port)
    end
  end
end