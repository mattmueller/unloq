module Unloq
  class Client

    attr_reader :api_key, :namespace

    # Initialize the client class that will be used for all Unloq interactions.
    #
    # @param [String] api_key Your Unloq api key.
    # @param [String] namespace The namespace under which Unloq events should be created, e.g. appname-dev

    def initialize api_key: nil, namespace: nil
      unless api_key && namespace
        raise ArgumentError.new("You must include both an api_key and namespace, e.g. Unloq::Client.new(api_key: 'foo', namespace: 'bar')")
      end

      @api_key   = api_key
      @namespace = namespace
    end

    def post endpoint, body = {}
      body.merge!(api_key: api_key, namespace: namespace)

      connection.post do |req|
        req.url endpoint
        req.body = body.to_json
      end
    end


    private

    # Set up basics of all HTTP connections for Unloq api requests

    def connection
      @connection ||= Faraday.new 'http://api.unloq.co' do |conn|
        conn.request :json
        conn.adapter Faraday.default_adapter
        conn.response :json, :content_type => /\bjson$/
      end
    end

  end
end