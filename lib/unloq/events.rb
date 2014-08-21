module Unloq
  module Events

    # Create an event via the Unloq API
    #
    # @param [Unloq::Entity] author Author involved in the event
    # @param [String] verb The verb of the event
    # @param [Unloq::Entity] recipient Recipient involved in the event
    # @param [Hash] meta A hash of additional metadata to send with the request

    def create_event author, verb, recipient, meta = {}
      validate_author(author)
      validate_recipient(recipient)
     
      body_to_post = {
        author_id: author.id,
        author_type: author.type,
        recipient_id: recipient.id,
        recipient_type: recipient.type,
        verb: verb,
        meta: meta
      }
     
      post('/events', body_to_post)
    end

  end
end