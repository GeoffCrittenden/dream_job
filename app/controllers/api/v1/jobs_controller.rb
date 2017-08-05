module Api
  module V1
    class JobsController < ApplicationController
      # Utilizing Rails default routing to effect semantic results, since no
      # db/ActiveRecord being used.  Simply connecting to the remote host
      # is :index, while checking the /about/jobs page is :show.
      def index
        response = fetch_response
        render status: response_message(response), json: { status: response.msg }
      end

      def show
        response = fetch_response
        status, msg = no_jobs_available?(response)
        render status: status, json: { status: msg }
      end

      private

      def request_uri
        URI(DreamJob::CONFIG.job_info.base_url)
      end

      def fetch_response
        Net::HTTP.get_response(request_uri)
      end

      def response_message(response)
        response.msg.downcase.split(/\s/).join('_').to_sym
      end

      def no_jobs_available?(response)
        return [404, :not_found] if response.body.include?(NO_JOBS_STRING)
        [200, :ok]
      end
    end
  end
end
