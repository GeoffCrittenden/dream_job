require 'rails_helper'

describe 'Routes', type: :request do
  it 'GET /' do
    get '/'
    expect(response).to redirect_to('/api/v1/available_jobs')
  end

  it 'GET /status' do
    get '/status'
    expect(response).to have_http_status(:ok)
  end
end
