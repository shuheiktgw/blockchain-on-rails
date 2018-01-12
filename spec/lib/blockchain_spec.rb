require 'rails_helper'

describe Blockchain do
  let(:blockchain) { Blockchain.new }

  describe '#new' do
    subject{ blockchain.last_block }
    it 'appends genesis block' do
      expect(subject.index).to eq (0)
      expect(subject.current_transactions).to be_empty
      expect(subject.proof).to eq 100
      expect(subject.previous_hash).to eq 1
    end
  end

  describe '#append_transaction' do
    subject(:index){ blockchain.append_transaction(sender: sender, recipient: recipient, amount: amount) }

    let(:sender) { 'sender1111' }
    let(:recipient) { 'recipient2222' }
    let(:amount) { 100 }

    it 'returns current index' do
      is_expected.to eq 0
    end
  end
end