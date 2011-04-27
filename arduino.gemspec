# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "arduino/version"

Gem::Specification.new do |s|
  s.name        = "arduino"
  s.version     = Arduino::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Ryan Greenberg"]
  s.email       = ["ryangreenberg@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{An interface to Arduino microcontrollers}
  s.description = %q{Use sensors connected to an Arduino board as input and control actuators from Ruby programs}

  s.rubyforge_project = "arduino"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
