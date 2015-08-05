$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'ididthis'
require 'dotenv'
Dotenv.load

require 'coveralls'
Coveralls.wear!
