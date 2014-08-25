require 'spec_helper'

describe Unloq::Client, '#lookup_author_ratings', vcr: true do
  let(:instance) { Unloq::Client.new(api_key: TestCredentials.api_key, namespace: TestCredentials.namespace) }
  subject { instance.lookup_author_ratings(author) }
  let(:author) { Unloq::Author.new(id: 12, type: 'User') }

  it "integrates properly (end to end test)" do
    result = subject
    expect(result).to eq({
      "rank" => 1,
      "points" => 10.0
    })
  end

  context "the author is not passed as an Unloq::Entity" do
    let(:author) { {id: 17, type: 'User'} }

    it "should raise an exception telling the user what went wrong" do
      expect {
        subject
      }.to raise_error(ArgumentError, /must be an Unloq::Author or Unloq::Recipient/)
    end
  end

  context "the author has no ratings" do
    let(:author) { Unloq::Author.new(id: 22, type: 'User') }

    it "should return empty ranks" do
      result = subject
    expect(result).to eq({
      "rank" => 0,
      "points" => 0.0
    })
    end
  end
end