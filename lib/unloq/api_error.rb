module Unloq
  class APIError < StandardError

    attr_reader :status, :body

    def initialize(status, body)
      @status = status
      @body   = body
      super(message)
    end

    def message
      "status_code:#{status} body:#{body.inspect}"
    end

  end
end