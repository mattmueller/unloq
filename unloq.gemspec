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
    "README.md",
    "lib/unloq.rb",
    "lib/unloq/version.rb",
    "lib/unloq/client.rb",
    "lib/unloq/api_error.rb",
    "lib/unloq/api_error/not_found_error.rb",
    "lib/unloq/entity.rb",
    "lib/unloq/entities/author.rb",
    "lib/unloq/entities/recipient.rb",
    "lib/unloq/events.rb",
    "lib/unloq/achievements.rb",
    "lib/unloq/scoreboards.rb",
    "lib/unloq/ratings.rb",
    "lib/unloq/activity.rb"
  ]
  s.files += Dir['spec/']
  s.homepage = "http://github.com/mattmueller/unloq"
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.summary = "Ruby gem for interacting with the Unloq API."

  s.add_runtime_dependency 'faraday', '~> 0.8'
  s.add_runtime_dependency 'faraday_middleware', '~> 0.8'

  s.add_development_dependency "rspec", "~> 3.0"
  s.add_development_dependency 'rdoc', '~> 4.0'
  s.add_development_dependency 'bundler', '~> 1.5'
  s.add_development_dependency 'rake', '~> 10.3'
  s.add_development_dependency 'vcr', '~> 2.9'
  s.add_development_dependency 'webmock', '~> 1.18'
end