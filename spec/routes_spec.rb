require 'rails_helper'

describe 'Routes', type: :request do
  it 'GET /' do
    get '/'
    expect(response).to redirect_to('/api/v1/available_jobs')
  end

  it 'GET /status' do
    get '/status'
    expect(response).to redirect_to('/api/v1/status')
  end
end
