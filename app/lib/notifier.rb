class Notifier
  class << self
    # As the need for new notifications arises, add them here
    # Break these out into explicit methods if needed
    %i[job_available site_down].each do |method_name|
      define_method("#{method_name}!") do
        send_msg!(status(method_name))
      end
    end

    private

    def status(name)
      name.to_s.split('_').last.to_sym
    end

    def send_msg!(status)
      Sms::Client.send!(status) if Rails.env.production?
    end
  end
end
