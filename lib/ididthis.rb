#!/usr/bin/env ruby
begin
  require "Win32/Console/ANSI" if RUBY_PLATFORM =~ /win32/
rescue LoadError
  raise "You must gem install win32console to use color on Windows"
end

require "ididthis/version"
require "ididthis/config"
require "ididthis/api"
require "ididthis/cli"
require "highline/import"
require "json"

# Main module
module Ididthis
  CONFIG_FILE = File.expand_path("~/.ididthis")
  API_VERSION = "0.1".freeze
  API_ROOT = "https://idonethis.com/api/v#{API_VERSION}".freeze

  ENDPOINTS = {
    team: "#{API_ROOT}/teams/",
    dones: "#{API_ROOT}/dones/",
    noop: "#{API_ROOT}/noop/"
  }.freeze
end
