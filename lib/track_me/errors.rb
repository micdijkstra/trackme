module TrackMe
  module Errors
    class InvalidData < StandardError
      attr_reader :message

      def initialize(message)
        @message = "Invalid Data: #{message}"
      end
    end
  end
end
