require 'spec_helper'

describe Unloq::Client, '.new' do
  
  it "should raise an error if no arguments are passed" do
    expect {
      Unloq::Client.new
    }.to raise_error(ArgumentError, /must include both an api_key and namespace/)
  end

  it "should raise an error if only an api key is passed" do
    expect {
      Unloq::Client.new(api_key: 'foo')
    }.to raise_error(ArgumentError, /must include both an api_key and namespace/)
  end

  it "should raise an error if only namespace is passed" do
    expect {
      Unloq::Client.new(namespace: 'app-dev')
    }.to raise_error(ArgumentError, /must include both an api_key and namespace/)
  end

  it "should instantiate happily with an api key and namespace" do
    expect(Unloq::Client.new(api_key: 'api-key', namespace: 'app-dev')).to be_instance_of(Unloq::Client)
  end
end

describe Unloq::Client, '#post', vcr: true do
  let(:instance) { Unloq::Client.new(api_key: api_key, namespace: namespace) }
  subject { instance.post(endpoint, body) }

  let(:api_key)   { TestCredentials.api_key }
  let(:namespace) { TestCredentials.namespace }

  context "all is well" do
    let(:endpoint) { '/events' }
    let(:body) { 
      {
        author_type: 'User',
        author_id: 1,
        verb: 'login',
        recipient_type: 'User',
        recipient_id: 1,
        meta: nil
      }
    }

    it "should make a successful post request" do
      expect(subject.status).to eq(201)
    end
  end
end