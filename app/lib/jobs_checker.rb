class JobsChecker
  class << self
    def check_for_jobs
      return Notifier.available_job! unless no_jobs_available?(fetch_response)
      puts "\n[#{Time.now.strftime('%D - %T')}] - #{NO_JOBS_MESSAGE}"
    end

    private

    def request_uri
      URI(JOBS_URL)
    end

    def fetch_response
      Net::HTTP.get_response(request_uri)
    end

    def no_jobs_available?(response)
      response.body.include?(NO_JOBS_MESSAGE)
    end
  end
end
