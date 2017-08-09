require 'rails_helper'

describe Sms::Client do
  let(:msg_list_class) { Twilio::REST::Api::V2010::AccountContext::MessageList }

  before do
    allow_any_instance_of(msg_list_class).to receive(:create).and_return(nil)
  end

  describe '#client' do
    it 'loads the Twilio Sms client' do
      expect(described_class.send(:client).class).to eq(Twilio::REST::Client)
    end
  end

  describe '#send!' do
    it 'instantiates sms client and creates new message' do
      allow(Rails.env).to receive(:production?).and_return(true)
      expect_any_instance_of(msg_list_class).to receive(:create)
      Sms::Client.send!(:available)
    end
  end
end
