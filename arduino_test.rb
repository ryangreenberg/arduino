require 'arduino'
require 'command_line_connector'

options = {
  :port => '/dev/tty.usbserial-A7006RZH',
  :read => Proc.new { |input, out| puts "Received: #{input}" }
}
arduino = Arduino.new(options)


#while true
#  arduino.send(UpdateColor.new(0.5, 1.0, 0.0))
#  sleep 1
#end

# TODO: sleep required because we don't know when the serial port is ready
# after opening it
sleep 5
arduino.write("a!")

command_line = CommandLineConnector.new(arduino)

begin
  command_line.interactive_mode
rescue Exception => e
end

puts "Goodbye"
arduino.close

# begin
#   while s = STDIN.gets do
#     arduino.write(s)
#   end
# rescue Exception => e
#   p e
#   puts "Interrupted; closing."
#   arduino.close
# end

# Thread.list.each { |t| t.join } 