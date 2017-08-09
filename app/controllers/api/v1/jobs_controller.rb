module Api
  module V1
    class JobsController < ApiController
      # Utilizing Rails default routing to effect semantic results, since
      # no db/ActiveRecord being used.  So checking the jobs page is :show.
      def show
        message = JobsChecker.check!
        Notifier.job_available! if message == :job_available
        Notifier.site_down!     if message == :site_down
        render status: 200, json: { status: message }
      end
    end
  end
end
