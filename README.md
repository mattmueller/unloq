unloq
=====

Ruby wrapper for the Unloq API.

Both this library as well as portions of the Unloq API are in active development, please keep this in mind when implementing.

## Installation

    gem install unloq

Or add it to your Gemfile

    gem 'unloq'

## Usage

### Instantiate an instance of Unloq::Client

This can be used for all requests within the scope of a given `api_key` and `namespace` - it should not need to be instantiated each time you make an API call.

    client = Unloq::Client.new(api_key: 'your-api-key', namespace: 'foo-dev')


### Events

#### EXAMPLES:

Create an event:

    author    = Unloq::Author.new(id: 12, type: 'User')
    recipient = Unloq::Recipient.new(id: 13, type: 'User')

    client.create_event(author, 'followed', recipient)


## Documentation

See [the documentation](http://rubydoc.info/gems/unloq/frames)

