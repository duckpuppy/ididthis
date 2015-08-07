# require "bundler/gem_tasks"
require "rspec/core/rake_task"
require "rubygems/tasks"
require "dotenv/tasks"
require "rake/clean"
require "rdoc/task"
require "rubocop/rake_task"
require "git-version-bump/rake-tasks"

lib_dir = File.expand_path("lib", File.dirname(__FILE__))
$LOAD_PATH.unshift(lib_dir) unless $LOAD_PATH.include?(lib_dir)

CLEAN.include("pkg")
CLEAN.include("coverage")

RSpec::Core::RakeTask.new(:spec)

RuboCop::RakeTask.new do |task|
  task.requires << "rubocop-rspec"
  task.options = ["-fh", "-ocoverage/rubocop.html",
                  "-fj", "-ocoverage/rubocop.json"]
end

Gem::Tasks.new(
  build: { gem: true, tar: true, zip: true },
  sign:  { checksum: true, pgp: false },
  scm:   { tag: false }
) do |tasks|
  tasks.console.command = "pry"
end

task default: :spec
task test: :spec

namespace :reports do
  desc "Run all code analysis tools"
  task :run => [:test, "^rubocop"]

  desc "Open test coverage in browser"
  task :coverage => [:test] do
    # TODO: Switch based on OS
    `open coverage/index.html`
  end

  desc "Open RuboCop report in browser"
  task :rubocop do
    sh "bundle exec rake rubocop" do
      # Ignore errors
    end
    `open coverage/rubocop.html`
  end
end
