require 'rails_helper'

describe Api::V1::ApiController, type: :controller do
  let(:test_response) { Net::HTTPOK.new(nil, 200, 'OK') }

  before do
    allow(Net::HTTP).to receive(:get_response).and_return(test_response)
  end

  describe 'GET status' do
    it 'returns 200 OK when the app is UP' do
      get :status
      assert_response :ok
    end
  end
end
