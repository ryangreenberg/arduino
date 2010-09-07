require 'arduino_connector'
require 'readline'

class CommandLineConnector < ArduinoConnector
  def initialize(args)
    super
  end
  
  def interactive_mode
    puts "Type commands to send to Arduino."
    puts "Type quit to exit."
    while line = STDIN.gets.strip
      break if line =~ /^(quit|exit)/
      send_message(line)
    end
  end
end