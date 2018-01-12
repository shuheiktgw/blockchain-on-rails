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
    subject(:transactions){ blockchain.current_transactions }

    let(:sender) { 'sender1111' }
    let(:recipient) { 'recipient2222' }
    let(:amount) { 100 }

    it 'returns current index' do
      expect(index).to eq 0
    end

    it 'appends a new transaction' do
      index
      expect(transactions.length).to eq 1
      expect(transactions.first.sender).to eq 'sender1111'
      expect(transactions.first.recipient).to eq 'recipient2222'
      expect(transactions.first.amount).to eq 100
    end
  end

  describe '#append_block' do
    subject(:index){ blockchain.append_transaction(sender: sender, recipient: recipient, amount: amount) }

    let(:sender) { 'sender1111' }
    let(:recipient) { 'recipient2222' }
    let(:amount) { 100 }

    it 'returns current index' do
      is_expected.to eq 0
    end
  end
end