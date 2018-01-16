require 'rails_helper'

RSpec.describe Transaction, type: :model do
  before do
    Block.create(proof: 100, previous_hash: 1)
  end

  describe '#self.append_transaction' do
    subject(:id) { Transaction.append_transaction!(sender: 'test_sender', recipient: 'test_recipient', amount: 100) }
    subject(:transaction) { Transaction.last }

    it "returns block's id" do
      expect(id).to eq 1
    end

    it 'appends transaction to the last block' do
      id
      expect(subject.block_id).to eq 1
      expect(subject.sender).to eq 'test_sender'
    end
  end
end
