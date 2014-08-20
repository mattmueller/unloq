require 'spec_helper'

describe Unloq::Client, '.new' do
  
  it "should raise an error if an api key is not passed" do
    expect {
      Unloq::Client.new
    }.to raise_error(ArgumentError, /include your api key/)
  end

  it "should instantiate happily with an api key" do
    expect(Unloq::Client.new('api-key')).to be_instance_of(Unloq::Client)
  end
end