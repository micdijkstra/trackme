module TrackMe
  module Event
    def self.included(base)
      base.extend(ClassMethods)
    end

    module ClassMethods
      def publish(actor, data={})
        (actor && data[:category]) or raise Errors::InvalidData
        event = new({ actor_id: actor.id }.merge(data))
        event.save
        event
      end
    end
  end
end
