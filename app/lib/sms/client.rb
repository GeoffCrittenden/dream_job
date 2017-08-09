module Sms
  class Client
    class << self
      def send!(status)
        return unless Rails.env.production?
        client.messages.create(from: FROM_PHONE_NUMBER,
                               to:   TO_PHONE_NUMBER,
                               body: message(status))
      end

      private

      def client
        Twilio::REST::Client.new(TWILIO_ACCT_SID, TWILIO_AUTH_TOKEN)
      end

      def message(status)
        message = status == :down ? SITE_DOWN_MESSAGE : JOBS_AVAILABLE_MESSAGE
        "#{message}\n#{JOBS_URL}"
      end
    end
  end
end
