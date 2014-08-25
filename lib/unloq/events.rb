module Unloq
  module Events

    # Create an event via the Unloq API
    #
    # @param author [Unloq::Entity] Author involved in the event
    # @param verb [String] The verb of the event
    # @param recipient [Unloq::Entity] Recipient involved in the event
    # @param meta [Hash] A hash of additional metadata to send with the request

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