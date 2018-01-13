require 'rails_helper'
require 'digest/sha2'

describe Blockchain do
  let(:blockchain) { Blockchain.new }

  describe '#new' do
    subject{ blockchain.last_block }
    it 'appends a genesis block' do
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
      expect{ index }.to change{ transactions.length }.from(0).to(1)
    end
  end

  describe '#append_block' do
    subject(:block){ blockchain.append_block(proof: proof, previous_hash: previous_hash) }
    subject(:chain){ blockchain.chain }

    let(:proof) { 12345 }
    let(:previous_hash) { 2 }

    it 'returns a new block' do
      expect(block.proof).to eq 12345
      expect(block.previous_hash).to eq 2
    end

    it 'appends a new block' do
      expect{ block }.to change{ chain.length }.from(1).to(2)
    end
  end

  describe '#compute_proof_of_work' do
    subject(:proof_of_work){ blockchain.compute_proof_of_work(last_proof) }
    subject(:result_hash) { Digest::SHA256.hexdigest(last_proof.to_s + proof_of_work.to_s) }

    let(:last_proof) { 111 }

    it 'returns a hash which contains 4 leading zeros' do
      expect(result_hash[-4..-1]).to eq('0000')
    end
  end
end