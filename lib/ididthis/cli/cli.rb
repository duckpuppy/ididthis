#!/usr/bin/env ruby
require 'thor'

module Ididthis
  module CLI
    class CLI < Thor
      def configure
        Config.configure!
        puts "Config file created at #{Config::PATH.inspect}"
      end
    end
  end
end

Ididthis::CLI::CLI.start(ARGV)
