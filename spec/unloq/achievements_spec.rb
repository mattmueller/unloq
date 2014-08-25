require 'spec_helper'

describe Unloq::Client, '#create_achievement', vcr: true do
  let(:instance) { Unloq::Client.new(api_key: TestCredentials.api_key, namespace: TestCredentials.namespace) }
  subject { instance.create_achievement(verb, observation_count, additional_options) }

  let(:verb) {'achievement'}
  let(:observation_count) { 10 }
  let(:additional_options) {{}}

  context "no author information" do

    it "should raise a somewhat helpful error" do
      expect { 
        subject
      }.to raise_error(ArgumentError, /include an author\/recipient/)
    end
  end

  context "no recipient information" do
    let(:additional_options) { {author_type: 'User'} }

    it "should raise a somewhat helpful error" do
      expect { 
        subject
      }.to raise_error(ArgumentError, /include an author\/recipient/)
    end
  end

  context "with author and recipient as entities" do
    let(:additional_options) {
      {
        author: Unloq::Author.new(id: 1, type: 'User'),
        recipient: Unloq::Recipient.new(id: 2, type: 'User')
      }
    }

    it "should happily create the achievement" do
      subject
    end
  end

  context "with author and recipient as types only" do
    let(:additional_options) {
      {
        author_type: 'User',
        recipient_type: 'Post'
      }
    }

    it "should happily create the achievement" do
      subject
    end
  end
end