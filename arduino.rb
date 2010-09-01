require 'rubygems'
require 'serialport'

class Arduino
  def initialize(options)
    raise Exception.new("No port specified") unless options[:port]
    options = default_options.merge(options)
    @connection = connect(options)
  end
    
  def connect(options)
    SerialPort.new(options[:port], options[:baud_rate], options[:data_bits], options[:stop_bits], options[:parity])
  end
  
  protected
  
  def default_options
    {
      :baud_rate => 9600,
      :data_bits => 8,
      :stop_bits => 1,
      :parity => SerialPort::NONE
    }
  end

end