module Unloq
  module Achievements

    # Create an achievement via the Unloq API
    #
    # @param verb [String] verb The verb for which this achievement should be unlocked
    # @param observation_count [Integer] observation_count The number of times the event must occur to unlock this achievement
    # @param author [Unloq::Entity] An individual author, if passed this achievement will only be attainable by this author. Required if author_type is not defined.
    # @param recipient [Unloq::Entity] An individual recipient that must be acted on to attain this achievement. Required if recipient_type is not defined.
    # @param author_type [String] An individual author type, if passed this achievement will only be attaintable by authors of this type. Required if author is not defined.
    # @param recipient_type [String] An individual recipient type that must be acted on to attain this achievement. Required if recipient is not defined.
    # @param points [Integer] The number of points that will be awarded when this achievement is attained.
    # @param image_path [String] An image path representing this achievement.

    def create_achievement verb, observation_count, 
                           author: nil, recipient: nil, author_type: nil, recipient_type: nil, 
                           points: nil, image_path: nil

      author_type, author_id       = extract_entity_details(author, author_type)
      recipient_type, recipient_id = extract_entity_details(recipient, recipient_type)

      body_to_post = {
        verb: verb,
        observation_count: observation_count,
        author_id: author_id,
        author_type: author_type,
        recipient_id: recipient_id,
        recipient_type: recipient_type,
        points: points,
        image_path: image_path
      }

      post('/achievements', body_to_post)
    end

  end
end