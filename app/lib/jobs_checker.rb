class JobsChecker
  class << self
    def check_for_jobs
      response = fetch_response

      return Notifier.site_down! unless response.is_a?(Net::HTTPSuccess)

      if no_jobs_available?(response)
        puts "\n[#{Time.now.strftime('%D - %T')}] - #{NO_JOBS_MESSAGE}"
      else
        Notifier.available_job!
      end
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
