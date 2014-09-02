module Unloq
  module Activity

    # Fetch activity for an author or author type
    #
    # @param author [Unloq::Entity] The author for which to fetch activity.
    # @param limit [Integer] The limit of number of records to return, defaults to 10.

    def activity author, limit: 10
      validate_author(author)

      get('/activity', "/#{author.type}/#{author.id}", additional_options: { limit: limit })
    end

  end
end