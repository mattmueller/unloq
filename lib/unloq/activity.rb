module Unloq
  module Activity

    # Fetch activity for an author or author type
    #
    # @param author [Unloq::Entity] The author for which to fetch activity. Required if author_type is not defined.
    # @param author_type [String] An author type for which to fetch activity. Required if author is not defined.
    # @param limit [Integer] The limit of number of records to return, defaults to 10.

    def activity author: nil, author_type: nil, limit: 10
      author_type, author_id = extract_entity_details(author, author_type)

      get('/activity', "/#{author_type}/#{author_id}", additional_options: { limit: limit })
    end

  end
end