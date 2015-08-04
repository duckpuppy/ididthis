#!/usr/bin/env ruby
require 'thor'
# require 'ididthis/cli/done'

module Ididthis
  class CommandLine < Thor
    desc "configure", "Reconfigure the client.  This will replace your existing config with a new config file."
    def configure
      Config.configure!
      puts "Config file created at #{Config::PATH.inspect}"
    end

    desc "post [OPTIONS] DONE", "Post a new done"
    def post(done)
      puts "You tried to post '#{done}', with options #{options}"
    end

    desc "goal [OPTIONS] DONE", "Post a new goal"
    def goal(done)
      post(done)
    end

    desc "log [OPTIONS]", "List dones"
    def log
    end

    # desc "done COMMANDS", "Work with your dones"
    # subcommand "done", Ididthis::CLI::Done

    desc "update", "Update your team list from the server."
    def update
    end

  end
end
