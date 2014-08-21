require 'spec_helper'

describe Unloq::Author, '.new' do
  it "should raise an error that uses the appropriate class name" do
    expect {
      Unloq::Author.new
    }.to raise_error(ArgumentError, /Author.new/)
  end
end