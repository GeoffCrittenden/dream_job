require 'rails_helper'

describe Api::V1::JobsController, type: :controller do
  let(:test_response) { Net::HTTPOK.new(nil, 200, 'OK') }

  before do
    allow(Net::HTTP).to receive(:get_response).and_return(test_response)
  end

  describe 'GET show' do
    it 'knows when the remote site is down' do
      allow(Net::HTTP).to receive(:get_response).and_return(Net::HTTPError)
      get :show
      expect(response.body).to eq({ status: :site_down }.to_json)
    end

    it 'knows when there are no available jobs' do
      allow(test_response).to receive(:body).and_return(NO_JOBS_MESSAGE)
      get :show
      expect(response.body).to eq({ status: :no_jobs }.to_json)
    end

    it 'knows when there are available jobs' do
      allow(test_response).to receive(:body).and_return('')
      get :show
      expect(response.body).to eq({ status: :job_available }.to_json)
    end

    it 'calls the Notifier when there are jobs available' do
      allow(test_response).to receive(:body).and_return('')
      expect(Notifier).to receive(:job_available!)
      get :show
    end
  end
end
