require 'rails_helper'

RSpec.describe Transaction, type: :model do
  describe '#self.append_transaction' do
    subject { Transaction.last }

    before do
      Transaction.append_transaction!(sender: 'test_sender', recipient: 'test_recipient', amount: 100)
    end

    it 'appends transaction to the last block' do
      expect(subject.block_id).to eq 1
      expect(subject.sender).to eq 'test_sender'
    end
  end
end
