$TESTING = true

require 'simplecov'
require 'coveralls'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter[
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]

SimpleCov.start do
  add_filter "/spec/"
  minimum_coverage(50.0)
end

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'ididthis'
require 'dotenv'
Dotenv.load

