require 'vcr'
require 'webmock/rspec'

WebMock.disable_net_connect!

VCR.configure do |c|
  c.hook_into :webmock

  c.cassette_library_dir = File.join('spec', 'fixtures', 'vcr')
end

module VcrHelper
  def with_vcr_cassette example, name = nil, options = {}, &block
    name ||= default_cassette_name_for_example(example)
    VCR.use_cassette name, options, &block
  end

  def default_cassette_name_for_example(example)
    example.
      full_description.
      underscore.
      sub(/\s/, '/').
      sub('#', '/').
      gsub(/[^\w\/]+/, "_")
  end
end

RSpec.configuration.include VcrHelper, vcr: true

RSpec.configure do |config|
  config.around(:each, vcr: true) do |example|
    with_vcr_cassette(example) do
      example.call
    end
  end
end
