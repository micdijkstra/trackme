# TrackMe

Simple user activity tracking for Ruby and Rails developers

## Usage

TrackMe is based on the idea that an actor performs an event.

To setup your event class add the following:
  `include TrackMe::Event`

To setup your actor class add the following:
  `include TrackMe::Actor`

By default, TrackMe looks for an event class called 'Event'. If you would like
to change this then set the following:
  `self.event_klass = CLASS`

Once setup, you can track a users activity in the following way:
  `current_user.track_me(category: 'View', label: 'Homepage')`

## Details

TrackMe events have the following options:
+ `:actor` (required) - The object that did the event
+ `:category` (required)- The event category, such as 'Message'
+ `:label` (option)- The label of the event category, such as 'New'
+ `:value` (option)- The value of the event category label, such as 'Hello Bob!'

TrackMe requires the following fields to save events:
+ `actor_id` - Integer
+ `category` - String
+ `label` - String
+ `value` - String

## Rails Example

First, you need to setup a model to be the actor, this is most likely going to
be your `User` model.

```ruby
class User
  include TrackMe::Actor

  # … existing model code
end
```

Then you need to setup a model to save the events, in most cases you will need
to create a new model with the fields `actor`, `category`, `label`, `value`.

In a Rails app backed by Postgress you would set this up with by running the
following on the command line:

`rails g model event actor:integer category:text label:text value:text`
`rake db:migrate`

And add the following to your `Event` model:

```ruby
class Event
  include TrackMe::Event

  # … existing model code
end
```

Let's say you have a `Messages` controller and you want to track when a user
sends a message, you would add the following code to your `create` action:

```ruby
class MessagesController
  # … existing controller code

  def create
    @sender = User.find(params[:sender_id])
    # … existing code
    @sender.track_me(category: 'Message', label: 'New', value: @message.body)
  end

  # … more controller code
end
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
