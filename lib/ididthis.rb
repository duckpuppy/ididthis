#!/usr/bin/env ruby

require "ididthis/version"
require "net/http"
require "highline/import"
require "json"

module Ididthis
  CONFIG_FILE = File.expand_path("~/.ididthis")
  API_VERSION = "0.0"
  API_ROOT = "https://idonethis.com/api/v#{API_VERSION}"
  $endpoints = {}
end
