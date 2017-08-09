class StatusController < ApplicationController
  def show
    render status: :ok, json: { status: :OK }
  end
end
