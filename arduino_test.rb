require 'arduino'

options = {
  :port => '/dev/tty.usbserial-A7006RZH',
  :read => Proc.new { |input, out| puts "Received: #{input}" }
}
arduino = Arduino.new(options)


#while true
#  arduino.send(UpdateColor.new(0.5, 1.0, 0.0))
#  sleep 1
#end
sleep 5
arduino.write("a!")

begin
  while s = STDIN.gets do
    arduino.write(s)
  end
rescue Exception => e
  p e
  puts "Interrupted; closing."
  arduino.close
end

# Thread.list.each { |t| t.join } 