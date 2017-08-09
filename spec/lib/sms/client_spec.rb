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
    context 'production environment' do
      before { allow(Rails.env).to receive(:production?).and_return(true) }

      context 'notification does not exist' do
        it 'does NOT instantiate sms client and send message' do
          expect_any_instance_of(msg_list_class).to_not receive(:create)
          described_class.send!(:yolo)
        end
      end

      context 'notification does exist' do
        it 'instantiates sms client and sends message' do
          expect_any_instance_of(msg_list_class).to receive(:create)
          described_class.send!(:available)
        end
      end
    end

    context 'non-production environment' do
      it 'does NOT create or send sms messages' do
        expect(described_class).to_not receive(:message_body)
        expect(described_class).to_not receive(:client)
        described_class.send!(:available)
      end
    end
  end
end
