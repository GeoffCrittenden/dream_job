require 'rails_helper'

describe JobsChecker do
  describe '#check_for_jobs' do
    let(:response) { Net::HTTPOK.new(nil, 200, :OK) }

    before { allow(Net::HTTP).to receive(:get_response).and_return(response) }

    context 'site down' do
      it 'calls Notifier#site_down!' do
        allow(Net::HTTP).to receive(:get_response).and_return(nil)
        expect(Notifier).to receive(:site_down!)
        described_class.check_for_jobs
      end
    end

    context 'no jobs available' do
      methods_list = Notifier.methods - Class.methods
      methods_list.each do |method|
        it "does NOT call Notifier##{method}" do
          allow(response).to receive(:body).and_return(NO_JOBS_MESSAGE)
          expect(Notifier).to_not receive(method)
          described_class.check_for_jobs
        end
      end
    end

    context 'jobs available' do
      it 'calls Notifier#job_available!' do
        allow(response).to receive(:body).and_return(JOBS_AVAILABLE_MESSAGE)
        expect(Notifier).to receive(:job_available!)
        described_class.check_for_jobs
      end
    end
  end
end
