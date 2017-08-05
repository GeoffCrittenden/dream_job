require 'rails_helper'

describe Api::V1::JobsController, type: :controller do
  let(:test_response)      { Net::HTTPOK.new(nil, 200, 'OK') }
  let(:no_jobs_avail_body) { NO_JOBS_STRING }
  let(:jobs_avail_body)    { '' }

  before do
    allow(Net::HTTP).to receive(:get_response).and_return(test_response)
  end

  it 'is able to connect to the remote url' do
    get :index
    assert_response :ok
  end

  it 'knows when there are no available jobs' do
    allow(test_response).to receive(:body).and_return(no_jobs_avail_body)
    get :show, params: { id: 1 }
    assert_response :not_found
  end

  it 'knows when there are available jobs' do
    allow(test_response).to receive(:body).and_return(jobs_avail_body)
    get :show, params: { id: 1 }
    assert_response :ok
  end
end
