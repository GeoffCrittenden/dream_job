module Sms
  class Client
    class << self
      def send!(status)
        return unless Rails.env.production?
        message = message_body(status)
        return if message.nil?
        client.messages.create(from: FROM_PHONE_NUMBER,
                               to:   TO_PHONE_NUMBER,
                               body: message)
      end

      private

      def client
        Twilio::REST::Client.new(TWILIO_ACCT_SID, TWILIO_AUTH_TOKEN)
      end

      def message_body(status)
        # add status messages here, a return of nil halts message sending
        # i.e., there is no default sms message if status does not match
        message = {
          available: JOBS_AVAILABLE_MESSAGE,
          check:     DAILY_SMS_CHECK,
          down:      SITE_DOWN_MESSAGE,
        }[status]
        return if message.nil?
        "#{message}\n#{JOBS_URL}"
      end
    end
  end
end
