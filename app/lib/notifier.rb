class Notifier
  class << self
    def available_job!
      Sms::Client.send!
    end
  end
end
