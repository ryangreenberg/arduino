$:.unshift 'lib'
require 'rspec/core/rake_task'
require 'bundler'
Bundler::GemHelper.install_tasks

desc "Run all specs"
RSpec::Core::RakeTask.new(:spec)
task :default => :spec