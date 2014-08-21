require 'spec_helper'

describe Unloq::Entity, '.new' do
  it "should raise an error if no arguments are passed" do
    expect {
      Unloq::Entity.new
    }.to raise_error(ArgumentError, /must include both an id and a type/)
  end

  it "should raise an error if only an id is passed" do
    expect {
      Unloq::Entity.new(id: 12)
    }.to raise_error(ArgumentError, /must include both an id and a type/)
  end

  it "should raise an error if only type is passed" do
    expect {
      Unloq::Entity.new(type: 'User')
    }.to raise_error(ArgumentError, /must include both an id and a type/)
  end

  it "should allow id, type and meta to be read" do
    entity = Unloq::Entity.new(id: 12, type: 'User', meta: {foo: 'bar'})
    expect(entity.id).to eq(12)
    expect(entity.type).to eq('User')
    expect(entity.meta).to eq({foo: 'bar'})
  end
end