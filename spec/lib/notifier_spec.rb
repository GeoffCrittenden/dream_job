require 'rails_helper'

describe Notifier do
  before do
    msg_list_class = Twilio::REST::Api::V2010::AccountContext::MessageList
    allow_any_instance_of(msg_list_class).to receive(:create).and_return(nil)
  end

  describe '#job_available!' do
    it 'calls sms client with :available' do
      expect(Sms::Client).to receive(:send!).with(:available)
      Notifier.job_available!
    end
  end

  describe '#site_down!' do
    it 'calls the sms client with :down' do
      expect(Sms::Client).to receive(:send!).with(:down)
      Notifier.site_down!
    end
  end

  describe '#status' do
    it 'returns the correct status' do
      expect(Notifier.send(:status, :site_down)).to eq(:down)
    end
  end
end
