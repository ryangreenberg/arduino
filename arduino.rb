require 'rubygems'
require 'serialport'

class Arduino
  def initialize(options)
    raise Exception.new("No port specified") unless options[:port]
    options = default_options.merge(options)
    @connection = connect(options)
    @read_until = "\r\n"
    @readers = []
    @readers.push options[:read] if options[:read]
    start_reader
  end
    
  def connect(options)
    # throws Errno::ENOENT on invalid port
    port = options.delete :port
    SerialPort.new(port, options)
  end
  
  def close
    @connection.close
  end
  
  def start_reader
    Thread.new do
      read_buffer = ''
      while !@connection.closed?
        read_buffer += @connection.getc.chr
        if read_buffer.end_with? @read_until
          update_readers(read_buffer)
          read_buffer = ''
        end
        # update_readers(@connection.getc.chr)
      end
    end
  end
  
  def update_readers(str)
    @readers.each do |reader|
      reader.call str, self
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