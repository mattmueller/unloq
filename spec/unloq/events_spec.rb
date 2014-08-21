require 'spec_helper'

describe Unloq::Client, '#create_event', vcr: true do
  let(:instance) { Unloq::Client.new(api_key: TestCredentials.api_key, namespace: TestCredentials.namespace) }
  subject { instance.create_event(author, verb, recipient, meta) }

  let(:author) { Unloq::Author.new(id: 12, type: 'User') }
  let(:recipient) { Unloq::Recipient.new(id: 17, type: 'OtherThing') }
  let(:verb) { 'acted_on' }
  let(:meta) { { foo: 'bar' } }

  it "integrates properly (end to end test)" do
    expect {
      subject
    }.to_not raise_error
  end

  context "the author is not passed as an Unloq::Entity" do
    let(:author) { {id: 17, type: 'User'} }

    it "should raise an exception telling the user what went wrong" do
      expect {
        subject
      }.to raise_error(ArgumentError, /must be an Unloq::Author or Unloq::Recipient/)
    end
  end

  context "the recipient is not passed as an Unloq::Entity" do
    let(:recipient) { {id: 17, type: 'User'} }

    it "should raise an exception telling the user what went wrong" do
      expect {
        subject
      }.to raise_error(ArgumentError, /must be an Unloq::Author or Unloq::Recipient/)
    end
  end
end