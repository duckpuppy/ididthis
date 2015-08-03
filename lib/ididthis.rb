#!/usr/bin/env ruby

require "ididthis/version"
require "ididthis/config"
require "ididthis/api"
require "highline/import"
require "json"

module Ididthis
  CONFIG_FILE = File.expand_path("~/.ididthis")
  API_VERSION = "0.1"
  API_ROOT = "https://idonethis.com/api/v#{API_VERSION}"

  ENDPOINTS = {}
  ENDPOINTS[:team] = "#{API_ROOT}/teams/"
  ENDPOINTS[:dones] = "#{API_ROOT}/dones/"
  ENDPOINTS[:noop] = "#{API_ROOT}/noop/"
end
