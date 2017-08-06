module Sms
  class Client
    class << self
      def send!
        client.messages.create(
          from: FROM_PHONE_NUMBER,
          to:   TO_PHONE_NUMBER,
          body: message
        )
      end

      private

      def client
        Twilio::REST::Client.new(TWILIO_ACCT_SID, TWILIO_AUTH_TOKEN)
      end

      def message
        "#{JOBS_AVAILABLE_MESSAGE}\n#{JOBS_URL}"
      end
    end
  end
end
