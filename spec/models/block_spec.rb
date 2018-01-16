require 'rails_helper'

RSpec.describe Block, type: :model do
  describe '#new' do
    it 'does not raise any errors' do
      expect { Block.new(proof: 100, previous_hash: 1) }.to_not raise_error
    end
  end


end
