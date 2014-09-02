require 'spec_helper'

describe Unloq::Client, '#activity', vcr: true do
  let(:instance) { Unloq::Client.new(api_key: TestCredentials.api_key, namespace: TestCredentials.namespace) }
  subject { instance.activity(author: author, author_type: author_type, limit: limit) }

  let(:author) { nil }
  let(:author_type) { nil }
  let(:limit) { nil }

  context "no author information" do

    it "should raise a somewhat helpful error" do
      expect { 
        subject
      }.to raise_error(ArgumentError, /include an author\/recipient/)
    end
  end

  context "with author as an entity" do
    let(:author) { Unloq::Author.new(id: 1, type: 'User') }

    it "should return a list of activity just for the given author"
  end

  context "with author as a type only" do
    let(:author_type) { 'User' }

    it "should return a list of activity for all authors with the given type"
  end
end