require 'rubygems'
require 'serialport'

class Arduino
  def initialize(options)
    raise Exception.new("No port specified") unless options[:port]
    options = default_options.merge(options)
    @connection = connect(options)
    @readers = []
    @readers.push options[:read] if options[:read]
    start_reader
  end
    
  def connect(options)
    # throws Errno::ENOENT on invalid port
    SerialPort.new(options[:port], options)
  end
  
  def close
    @connection.close
  end
  
  def start_reader
    Thread.new do |t|
      read_buffer = ''
      while !@connection.closed?
        # read_buffer += @connection.getc
        # if read_buffer.end_with? @read_until
        #   update_readers(read_buffer)
        #   read_buffer = ''
        # end
        update_readers(@connection.getc)
      end
    end
  end
  
  def update_readers(str)
    @readers.each do |reader|
      reader.call str
    end
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