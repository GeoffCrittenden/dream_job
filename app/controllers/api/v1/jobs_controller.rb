module Api
  module V1
    class JobsController < ApiController
      # Utilizing Rails default routing to effect semantic results, since no
      # db/ActiveRecord being used.  Simply connecting to the remote host
      # is :index, while checking the /about/jobs page is :show.
      def index
        response = fetch_response
        render status: response_message(response), json: { status: response.msg }
      end

      def show
        response = fetch_response
        if no_jobs_available?(response)
          render status: 200, json: { status: :no_jobs }
        else
          Notifier.job_available!
          render status: 200, json: { status: :job_available }
        end
      end

      private

      def request_uri
        URI(JOBS_URL)
      end

      def fetch_response
        Net::HTTP.get_response(request_uri)
      end

      def response_message(response)
        response.msg.downcase.split(/\s/).join('_').to_sym
      end

      def no_jobs_available?(response)
        response.body.include?(NO_JOBS_MESSAGE)
      end
    end
  end
end
