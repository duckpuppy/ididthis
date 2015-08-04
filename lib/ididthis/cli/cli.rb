#!/usr/bin/env ruby
require 'thor'

module Ididthis
  module CLI
    class CLI < Thor
      def configure
        Config.configure!
        puts "Config file created at #{Config::PATH.inspect}"
      end

      def done
      end

      def refresh
      end

    end
  end
end
