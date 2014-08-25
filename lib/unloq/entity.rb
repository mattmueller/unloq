module Unloq
  class Entity
    attr_reader :id, :type, :meta

    # Initialize an instance of an unloq entity. This has subclasses for Author and Recipient for ease of understanding.
    # @param id [String] The ID of the entity (may also be an integer), e.g. 1 or '1'
    # @param type [String] The type of the entity, e.g. 'User'

    def initialize id: nil, type: nil, meta: {}
      unless id && type
        raise ArgumentError.new("You must include both an id and a type, e.g. #{self.class.to_s}.new(id: 1, type: 'User')")
      end

      @id   = id
      @type = type
      @meta = meta
    end
  end
end