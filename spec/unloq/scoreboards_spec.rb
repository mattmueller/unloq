require 'spec_helper'

describe Unloq::Client, '#scoreboards', vcr: true do
  let(:instance) { Unloq::Client.new(api_key: TestCredentials.api_key, namespace: TestCredentials.namespace) }
  subject { instance.scoreboards }

  it "integrates properly (end to end test)" do
    first_result = subject.first
    expect(first_result).to eq({
      "player_id" => '12',
      "rank" => 1,
      "points" => '10.00'
    })
  end

  context "the namespace has no scoreboard" do
    let(:instance) { Unloq::Client.new(api_key: TestCredentials.api_key, namespace: "#{TestCredentials.namespace}abc123") }

    it "returns an empty array" do
      result = subject
      expect(result).to eq([])
    end
  end
end