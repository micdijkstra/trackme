module TrackMe
  module Event
    extend ActiveSupport::Concern

    module ClassMethods
      def publish(actor, data={})
        (actor && data[:category]) or raise Errors::InvalidData
        event = new({ actor: actor }.merge(data))
        event.save
        event
      end
    end
  end
end
