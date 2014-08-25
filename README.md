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

```ruby
client = Unloq::Client.new(api_key: 'your-api-key', namespace: 'foo-dev')
```


### Events

Create an event:

```ruby
author    = Unloq::Author.new(id: 12, type: 'User')
recipient = Unloq::Recipient.new(id: 13, type: 'User')

client.create_event(author, 'followed', recipient)
```

Lookup an event:

```ruby
author    = Unloq::Author.new(id: 12, type: 'User')
recipient = Unloq::Recipient.new(id: 13, type: 'User')

# Note: this method will raise an Unloq::APIError with a status of 404 if the event is not found
client.lookup_event(author, 'followed', recipient)
```


### Achievements

Create an achievement

```ruby
#See [the documentation](http://rubydoc.info/gems/unloq/frames) for additional keyword arguments

#Creating achievements based only on author and recipient types that are triggered after 2 observations

client.create_achievement('viewed-page', 2, author_type: 'User', recipient_type: 'Post')

#Creating achievements with author and recipient as specific entities that are triggered after 2 observations

author    = Unloq::Author.new(id: 12, type: 'User')
recipient = Unloq::Recipient.new(id: 13, type: 'User')
client.create_achievement('poked', 2, author: author, recipient: recipient)
```


### Scoreboards

Fetch scoreboards for the namespace

```ruby
client.scoreboards
```


### Ratings

Lookup ratings for an author in the namespace

```ruby
author = Unloq::Author.new(id: 12, type: 'User')

client.lookup_author_ratings(author)
```


## Documentation

See [the documentation](http://rubydoc.info/gems/unloq/frames)

