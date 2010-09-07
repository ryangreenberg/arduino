require 'rubygems'
require 'serialport'

class Arduino
  attr_reader :sp
  def initialize(options)
    raise Exception.new("No port specified") unless options[:port]
    options = default_options.merge(options)
    @connection = connect(options)
    @writer = Writer.new(@connection)
    @read_until = "\r\n"
    @listeners = []
    @listeners.push options[:read] if options[:read]
    start_reader
  end

  def write(data)
    @writer.write(data)
  end
  alias send write
    
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
          update_listeners(read_buffer)
          read_buffer = ''
        end
        # update_listeners(@connection.getc.chr)
      end
    end
  end
  
  def update_listeners(msg)
    @listeners.each do |listener|
      # Assume that a listener is a Proc if it doesn't respond to :receive_message
      if listener.respond_to? :receive_message
        listener.receive_message msg
      else
        listener.call msg, @writer
      end
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
  
  class Writer
    
    def initialize(connection)
      @connection = connection
    end
    
    def write(data)
      @connection.puts(data)
    end
  end

end