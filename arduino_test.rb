require 'arduino'

options = {
  :port => '/dev/tty.usbserial-A7006RZH',
  :read => Proc.new { |input, out| puts input }
}
arduino = Arduino.new(options)

begin
  Thread.list.each { |t| t.join }  
rescue Exception => e
  p e
  puts "Interrupted; closing."
  arduino.close
end


