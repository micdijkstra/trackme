# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'track_me/version'

Gem::Specification.new do |spec|
  spec.name          = "track_me"
  spec.version       = TrackMe::VERSION
  spec.authors       = ["Michael Dijkstra"]
  spec.email         = ["micdijkstra@gmail.com"]
  spec.description   = %q{Simple user activity tracking}
  spec.summary       = %q{Provides an easy way for Ruby and Rails developers to track user activity.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
