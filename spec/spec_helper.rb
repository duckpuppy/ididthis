$TESTING = true

require 'dotenv'
Dotenv.load

require 'simplecov'

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'ididthis'
