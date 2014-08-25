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

    # Lookup an event via the Unloq API
    #
    # @param author [Unloq::Entity] Author of the event you want to look up
    # @param verb [String] Verb of the event you want to look up
    # @param recipient [Unloq::Entity] Recipient of the event you want to look up

    def lookup_event author, verb, recipient
      validate_author(author)
      validate_recipient(recipient)

      get('/events', "/#{author.type}/#{author.id}/#{verb}/#{recipient.type}/#{recipient.id}")
    end

  end
end