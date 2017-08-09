require 'rails_helper'

describe StatusController, type: :controller do
  describe 'GET /status' do
    it 'returns 200 OK when the app is UP' do
      get :show
      assert_response :ok
    end
  end
end
