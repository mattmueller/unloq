require 'spec_helper'

describe Unloq::Client, '.new' do
  
  it "should respond to new" do
    expect(Unloq::Client.respond_to?(:new)).to eq(true)
  end
end