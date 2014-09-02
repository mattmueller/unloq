require 'spec_helper'

describe Unloq::Client, '#activity', vcr: true do
  let(:instance) { Unloq::Client.new(api_key: TestCredentials.api_key, namespace: TestCredentials.namespace) }
  subject { instance.activity(author, limit: limit) }

  let(:author) { nil }
  let(:author_type) { nil }
  let(:limit) { 10 }

  context "with author as an entity" do
    let(:author) { Unloq::Author.new(id: 3, type: 'User') }

    it "should return a list of activity just for the given author" do
      result = subject
      expect(result.length).to eq(3)
      expect(result.first['verb']).to eq('viewed')
      expect(result.first['recipient_type']).to eq('Topic')
    end

    context "limiting the number of results" do
      let(:limit) { 1 }

      it "should only return that number of events" do
        expect(subject.length).to eq(1)
      end
    end
  end

  context "passing something other than an unloq entity as the author" do
    let(:author_type) { { id: 12, type: 'whatevs' } }

    it "should raise a somewhat helpful error" do
      expect { 
        subject
      }.to raise_error(ArgumentError, /must be an Unloq::Author/)
    end
  end
end