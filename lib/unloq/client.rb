module Unloq
  class Client

    attr_reader :api_key

    def initialize api_key = nil
      raise ArgumentError.new("Please include your api key, e.g. Unloq::Client.new(API_KEY)") unless api_key
      @api_key = api_key
    end

  end
end