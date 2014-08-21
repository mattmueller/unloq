module Unloq
  class Entity
    attr_reader :id, :type, :meta

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