class JobsChecker
  class << self
    def check_for_jobs
      response = Net::HTTP.get_response(URI(JOBS_URL))

      return Notifier.site_down! unless response.is_a?(Net::HTTPSuccess)

      if no_jobs_available?(response)
        puts "\n[#{Time.now.strftime('%D - %T')}] - #{NO_JOBS_MESSAGE}"
      else
        Notifier.job_available!
      end
    end

    private

    def no_jobs_available?(response)
      response.body.include?(NO_JOBS_MESSAGE)
    end
  end
end
