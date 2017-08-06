class Notifier
  class << self
    # As the need for new notifications arises, add them here
    # Break these out into explicit methods if needed
    %i[job_available site_down].each do |method_name|
      define_method("#{method_name}!") do
        Sms::Client.send!(status(method_name))
      end
    end

    private

    def status(name)
      name.to_s.split('_').last.to_sym
    end
  end
end
