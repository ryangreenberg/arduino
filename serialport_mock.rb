class SerialPortMock
  attr_reader :file
  def initialize(port, baud_rate, data_bits, stop_bits, parity)
    @port = port
    @baud_rate = baud_rate
    @data_bits = data_bits
    @stop_bits = stop_bits
    @parity = parity
    @file = File.open('tmp', 'r')
  end
  
  def method_missing(m, *args)
    @file.send(m, *args)
  end
end