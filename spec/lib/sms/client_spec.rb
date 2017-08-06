require 'rails_helper'

describe Sms::Client do
  let(:msg_list_class) { Twilio::REST::Api::V2010::AccountContext::MessageList }

  before do
    allow_any_instance_of(msg_list_class).to receive(:create).and_return(nil)
  end

  describe '#send!' do
    it 'instantiates sms client and creates new message' do
      expect_any_instance_of(msg_list_class).to receive(:create)
      Sms::Client.send!(:available)
    end
  end
end
