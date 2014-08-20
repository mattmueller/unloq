# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "unloq/version"

Gem::Specification.new do |s|
  s.name = "unloq"
  s.version = Unloq::VERSION
  s.authors = ["Matt Mueller"]
  s.description = "Ruby gem for interacting with the Unloq API.  See http://www.unloq.co/api_docs/index for more information."
  s.email = "muellermr@gmail.com"
  s.files = [
    "Gemfile",
    "LICENSE",
    "README.md"
  ]
  s.files += Dir['spec/']
  s.homepage = "http://github.com/mattmueller/unloq"
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.summary = "Ruby gem for interacting with the Unloq API."

  s.add_runtime_dependency "faraday"
  s.add_runtime_dependency "faraday_middleware", ">= 0.8.0"

  s.add_development_dependency "rspec"
  s.add_development_dependency "rdoc"
  s.add_development_dependency "bundler"
  s.add_development_dependency "rake"
  s.add_development_dependency "vcr"
  s.add_development_dependency "webmock"
end