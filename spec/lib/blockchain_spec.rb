require 'rails_helper'
require 'digest/sha2'

describe Blockchain do
  describe '#compute_proof_of_work' do
    subject(:proof_of_work){ Blockchain.compute_proof_of_work(last_proof) }
    subject(:result_hash) { Digest::SHA256.hexdigest(last_proof.to_s + proof_of_work.to_s) }

    let(:last_proof) { 111 }

    it 'returns a hash which contains 4 leading zeros' do
      expect(result_hash[-4..-1]).to eq('0000')
    end
  end
end