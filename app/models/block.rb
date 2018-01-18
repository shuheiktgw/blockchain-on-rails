class Block < ApplicationRecord
  has_many :transactions

  # Create a new Block in the Blockchain
  #
  # @param proof: <int> The proof given by the Proof of Work algorithm
  # @param previous_hash: (Optional) <str> Hash of previous Block
  # @return <Block> New Block
  def self.append_block(proof:, previous_hash: nil)

    # self.create!(proof: proof, previous_hash: previous_hash || Blockchain.compute_)
  end
end
