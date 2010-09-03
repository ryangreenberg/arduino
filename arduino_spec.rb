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
    
    # it "merges the options with default options" do
    #   arduino = Arduino.new :port => '/dev/tty.usbserial-A7006SoU'
    #   pending
    # end
    
    it "open a connection to the specified serial port" do
      options = 
      port = '/dev/tty.usbserial-A7006SoU'
      mock(SerialPort).new(satisfy { |p| p == port }, options)
      arduino = Arduino.new(:port => port)
    end
  end
end