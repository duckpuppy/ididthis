# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ididthis/version'

Gem::Specification.new do |spec|
  spec.name          = "ididthis"
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

  spec.add_dependency "highline"
  spec.add_dependency "rest-client"
  spec.add_dependency "thor"
  spec.add_development_dependency "dotenv"
  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "pry"
end
