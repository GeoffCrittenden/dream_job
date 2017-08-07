module Api
  module V1
    class ApiController < ApplicationController
      def status
        render status: :ok, json: { status: :OK }
      end
    end
  end
end
