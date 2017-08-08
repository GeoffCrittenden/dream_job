class JobsChecker
  class << self
    def check_for_jobs
      response = Net::HTTP.get_response(URI(JOBS_URL))

      return Notifier.site_down! unless response.is_a?(Net::HTTPSuccess)

      Notifier.job_available! unless no_jobs_available?(response)
    end

    private

    def no_jobs_available?(response)
      response.body.include?(NO_JOBS_MESSAGE)
    end
  end
end
