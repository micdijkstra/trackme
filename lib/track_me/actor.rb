module TrackMe
  module Actor
    extend ActiveSupport::Concern
    attr_accessor :event_klass

    def track_me(options={})
      validate_track_me(options) or raise StandardError
      event_class.publish(self, options)
    end

    def validate_track_me(options)
      options[:category].empty? == false && options[:label].empty? == false
    rescue
      raise Errors::InvalidData
    end

    def event_class
       @event_klass ||= event_klass ? event_klass.classify.constantize : ::Event
    end
  end
end
