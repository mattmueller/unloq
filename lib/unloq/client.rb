module Unloq
  class Client

    include Events
    include Achievements

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

    # Make a post request to the Unloq API
    #
    # @param [String] endpoint The resource endpoint, e.g. /events
    # @param [Hash] body The body payload that should be POSTed

    def post endpoint, body = {}
      body.merge!(api_key: api_key, namespace: namespace)

      response = connection.post do |req|
        req.url endpoint
        req.body = body.to_json
      end

      format_response_or_raise_error(response)
    end


    # Validate that any author used is of the appropriate type
    def validate_author author
      raise ArgumentError.new("Author must be an Unloq::Author or Unloq::Recipient") unless author.is_a?(Unloq::Entity)
    end

    #Validate that any recipient used is of the appropriate type
    def validate_recipient recipient
      raise ArgumentError.new("Recipient must be an Unloq::Author or Unloq::Recipient") unless recipient.is_a?(Unloq::Entity)
    end

    #Extract entity type and ID from inclusion of either an Unloq::Entity or a *_type argument
    def extract_entity_details entity = nil, entity_type = nil
      if entity
        validate_author(entity)
        return [entity.type, entity.id]
      else
        unless entity_type
          raise ArgumentError.new("Must include an author/recipient as an Unloq::Entity instance or include an author_type or recipient_type")
        end
        return [entity_type, nil]
      end
    end

    private

    # Return either the response body or raise a helpful error

    def format_response_or_raise_error response
      if response.status / 100 == 2
        response.body
      else
        raise Unloq::APIError.new(response.status, response.body)
      end
    end

    # Set up basics of all HTTP connections for Unloq api requests

    def connection
      @connection ||= Faraday.new(url: 'http://api.unloq.co', headers: default_headers) do |conn|
        conn.request :json
        conn.adapter Faraday.default_adapter
        conn.response :json, :content_type => /\bjson$/
      end
    end

    # Set default headers for all requests

    def default_headers
      {
        user_agent: "Unloq ruby gem #{Unloq::VERSION}"
      }
    end

  end
end