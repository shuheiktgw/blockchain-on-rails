require 'rails_helper'

RSpec.describe Block, type: :model do
  describe 'self.new' do
    it 'does not raise any errors' do
      expect { Block.new(proof: 100, previous_hash: 1) }.to_not raise_error
    end
  end

  describe 'self.append_block' do
    subject { Block.append_block(proof: 1111, previous_hash: previous_hash) }

    context 'when previous_hash is given' do
      let(:previous_hash) { '1111' }

      it 'returns block with the given previous hash' do
        expect(subject.previous_hash).to eq '1111'
      end
    end

    context 'when previous_hash is not given' do
      let(:previous_hash) { nil }

      it 'returns block with computed previous hash' do
        expect(subject.previous_hash).to eq 'ad17bfec2356d85e840d9d5442c59e8dc9ade9da3737c8d2c78306e4dad7fc84'
      end
    end
  end
end
