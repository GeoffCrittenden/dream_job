require 'rails_helper'

describe JobsChecker do
  describe '#check!' do
    let(:response) { Net::HTTPOK.new(nil, 200, :OK) }

    before { allow(Net::HTTP).to receive(:get_response).and_return(response) }

    it 'site down' do
      allow(Net::HTTP).to receive(:get_response).and_return(Net::HTTPError)
      expect(described_class.check!).to eq(:site_down)
    end

    it 'no jobs available' do
      allow(response).to receive(:body).and_return(NO_JOBS_MESSAGE)
      expect(described_class.check!).to eq(:no_jobs)
    end

    it 'jobs available' do
      allow(response).to receive(:body).and_return('')
      expect(described_class.check!).to eq(:job_available)
    end
  end
end
