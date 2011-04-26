# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "arduino_gem/version"

Gem::Specification.new do |s|
  s.name        = "arduino_gem"
  s.version     = ArduinoGem::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Ryan Greenberg"]
  s.email       = ["ryangreenberg@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{A Ruby-based interface to Arduino}
  s.description = %q{Send and receive data to Arduino microcontrollers}

  s.rubyforge_project = "arduino"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
