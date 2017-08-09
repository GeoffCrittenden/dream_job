class JobsChecker
  class << self
    def check!
      response = Net::HTTP.get_response(URI(JOBS_URL))
      if response.is_a?(Net::HTTPSuccess)
        return :job_available if jobs_available?(response)
        :no_jobs
      else
        :site_down
      end
    end

    private

    def jobs_available?(response)
      !response.body.include?(NO_JOBS_MESSAGE)
    end
  end
end
