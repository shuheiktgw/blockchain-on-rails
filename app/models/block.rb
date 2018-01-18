class Block < ApplicationRecord
  has_many :transactions

  # Create a new Block in the Blockchain
  #
  # @param proof: <int> The proof given by the Proof of Work algorithm
  # @param previous_hash: (Optional) <str> Hash of previous Block
  # @return <Block> New Block
  def self.append_block(proof:, previous_hash: nil)
    hash =  if previous_hash
      previous_hash
    else
      json = BlockSerializer.new(Block.last).to_json
      Blockchain.compute_hash(json)
    end

    create!(proof: proof, previous_hash: hash)
  end
end
