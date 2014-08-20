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


  end
end