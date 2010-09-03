require 'rubygems'
require 'spec'
require 'rr'
Spec::Runner.configure do |config|
  config.mock_with :rr
end
# extend RR::Adapters::RRMethods

require 'arduino'

describe "Arduino" do
  describe "#new" do
    it "should require a port" do
      lambda { Arduino.new }.should raise_error
    end
    
    it "should override default options with given options" do
      options = {
        :port => '/dev/tty.usbserial-A7006SoU',
        :baud_rate => 999,
        :data_bits => 998,
        :stop_bits => 997,
        :parity => SerialPort::NONE
      }
      mock(SerialPort).new(options[:port], options[:baud_rate], options[:data_bits], options[:stop_bits], options[:parity])
      arduino = Arduino.new options      
    end
    
    it "open a connection to the specified serial port with the default options" do
      port = '/dev/tty.usbserial-A7006SoU'
      mock(SerialPort).new(port, 9600, 8, 1, 0)
      arduino = Arduino.new(:port => port)
    end
  end
end