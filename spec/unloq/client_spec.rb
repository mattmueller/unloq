require 'spec_helper'

describe Unloq::Client, '.new' do
  
  it "should raise an error if no arguments are passed" do
    expect {
      Unloq::Client.new
    }.to raise_error(ArgumentError, /must include both an api_key and namespace/)
  end

  it "should raise an error if only an api key is passed" do
    expect {
      Unloq::Client.new(api_key: 'foo')
    }.to raise_error(ArgumentError, /must include both an api_key and namespace/)
  end

  it "should raise an error if only namespace is passed" do
    expect {
      Unloq::Client.new(namespace: 'app-dev')
    }.to raise_error(ArgumentError, /must include both an api_key and namespace/)
  end

  it "should instantiate happily with an api key and namespace" do
    expect(Unloq::Client.new(api_key: 'api-key', namespace: 'app-dev')).to be_instance_of(Unloq::Client)
  end
end