require "bundler/gem_tasks"
require "rspec/core/rake_task"
# require "rubygems/tasks"
require "dotenv/tasks"

lib_dir = File.expand_path('lib', File.dirname(__FILE__))
$LOAD_PATH.unshift(lib_dir) unless $LOAD_PATH.include?(lib_dir)

RSpec::Core::RakeTask.new(:spec)
# Gem::Tasks.new(
#   build: {gem: true, tar: true, zip:true},
#   sign: {checksum: true, pgp: false}
# ) do |tasks|
#   tasks.console.command = 'pry'
# end

task :default => :spec
task :test => :spec
