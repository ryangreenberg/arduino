class SerialPortMock
  attr_reader :file
  def initialize(port, baud_rate, data_bits, stop_bits, parity)
    @port = port
    @baud_rate = baud_rate
    @data_bits = data_bits
    @stop_bits = stop_bits
    @parity = parity
    @file = File.open('tmp', 'rw')
    @file.write("Hello world\n\r")
    @file.seek(0)
  end
  
  def method_missing(m, *args)
    @file.send(m, *args)
  end
  
  # def getc
  #   min = 32
  #   max = 128
  #   (rand(max - min) + min).chr
  # end
end