# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ididthis/version'

Gem::Specification.new do |spec|
  spec.name          = "ididthis"
  spec.description   = "A command line utility for posting and viewing dones on iDidThis."
  spec.version       = Ididthis::VERSION
  spec.authors       = ["Patrick Aikens"]
  spec.email         = ["paikens@gmail.com"]

  spec.summary       = %q{Command line interface to iDoneThis using the API}
  spec.homepage      = "https://github.com/duckpuppy/ididthis.git"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "highline", "~> 1.7"
  spec.add_dependency "rest-client", "~> 1.8"
  spec.add_dependency "thor", "~> 0.19.1"
  spec.add_development_dependency "rubygems-tasks", "~> 0.2.4"
  spec.add_development_dependency "dotenv", "~> 2.0"
  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.3"
  spec.add_development_dependency "pry", "~> 0.9"
  spec.add_development_dependency "travis", "~>1.8"
end
