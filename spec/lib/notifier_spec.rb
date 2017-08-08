require 'rails_helper'

describe Notifier do
  # before do
  #   msg_list_class = Twilio::REST::Api::V2010::AccountContext::MessageList
  #   allow_any_instance_of(msg_list_class).to receive(:create).and_return(nil)
  # end

  describe '#job_available!' do
    it 'calls #send_msg! with :available' do
      expect(described_class).to receive(:send_msg!).with(:available)
      described_class.job_available!
    end
  end

  describe '#site_down!' do
    it 'calls send_msg! with :down' do
      expect(described_class).to receive(:send_msg!).with(:down)
      described_class.site_down!
    end
  end

  describe '#status' do
    it 'returns the correct status' do
      expect(described_class.send(:status, :site_down)).to eq(:down)
    end
  end

  describe '#send_msg!' do
    it 'calls Sms::Client#send!' do
      allow(Rails.env).to receive(:production?).and_return(true)
      allow(Sms::Client).to receive(:send!).and_return(nil)
      expect(Sms::Client).to receive(:send!)
      described_class.send(:send_msg!, :test)
    end
  end
end
