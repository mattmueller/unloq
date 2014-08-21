require 'spec_helper'

describe Unloq::Recipient, '.new' do
  it "should raise an error that uses the appropriate class name" do
    expect {
      Unloq::Recipient.new
    }.to raise_error(ArgumentError, /Recipient.new/)
  end
end