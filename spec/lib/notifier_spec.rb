require 'rails_helper'

describe Notifier do
  before do
    msg_list_class = Twilio::REST::Api::V2010::AccountContext::MessageList
    allow_any_instance_of(msg_list_class).to receive(:create).and_return(nil)
  end

  describe '#job_available!' do
    it 'calls the sms notifications client' do
      expect(Sms::Client).to receive(:send!)
      Notifier.job_available!
    end
  end
end
