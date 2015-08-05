# require "bundler/gem_tasks"
require "rspec/core/rake_task"
require "rubygems/tasks"
require "dotenv/tasks"
require "rake/clean"
require "rdoc/task"
require "rubocop/rake_task"

lib_dir = File.expand_path('lib', File.dirname(__FILE__))
$LOAD_PATH.unshift(lib_dir) unless $LOAD_PATH.include?(lib_dir)

CLEAN.include('pkg')

RSpec::Core::RakeTask.new(:spec)

RuboCop::RakeTask.new do |task|
  task.requires << 'rubocop-rspec'
end

Gem::Tasks.new(
  build: {gem: true, tar: true, zip:true},
  sign: {checksum: true, pgp: false}
) do |tasks|
  tasks.console.command = 'pry'
end

task :default => :spec
task :test => :spec
