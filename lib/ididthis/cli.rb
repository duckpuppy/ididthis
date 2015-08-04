#!/usr/bin/env ruby
require 'thor'
require 'ididthis'

# require 'ididthis/cli/done'

module Ididthis
  class CommandLine < Thor
    desc "configure", "Reconfigure the client.  This will replace your existing config with a new config file."
    def configure
      Config.configure!
      puts "Config file created at #{Config::PATH.inspect}"
    end

    desc "post [OPTIONS] DONE", "Post a new done"
    option :date, :aliases => "-d", :type => :string, :default => Time.new.getlocal.strftime("%Y-%m-%d"), :banner => "YYYY-MM-DD", :desc => "The date for this done."
    option :team, :aliases => "-t", :type => :string, :default => Ididthis::Config[:team], :banner => "SHORT_NAME", :desc => "The team to post to."
    option :goal, :aliases => "-g", :type => :boolean, :desc => "Post a goal rather than a done"
    def post(done)
      c = Ididthis::API::Client.new
      c.post_done(Ididthis::Config[:token], options[:goal] ? "[] #{done}" : done, options)
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
