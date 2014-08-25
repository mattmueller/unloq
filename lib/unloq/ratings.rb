module Unloq
  module Ratings

    # Fetch the ratings for an author
    #
    # @param author [Unloq::Entity] The author for which you want to retrieve ratings

    def lookup_author_ratings author
      validate_author(author)

      get('/ratings', "/#{author.id}")
    end

  end
end