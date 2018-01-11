require 'date'

class Blockchain

  attr_accessor :chain, :current_transactions

  def initialize
    @chain = []
    @current_transactions = []
  end

  # Create a new Block in the Blockchain
  # @param proof: <int> The proof given by the Proof of Work algorithm
  # @param previous_hash: (Optional) <str> Hash of previous Block
  # @return <Block> New Block
  def append_block(proof:, previous_hash: nil)
    block = create_block(proof: proof, previous_hash: previous_hash)
    chain.push(block)

    # reset the current list of transactions
    @current_transactions = []

    block
  end

  # Creates a new transaction to go into the next mined Block
  #
  # @param  sender: <str> Address of the Sender
  # @param  recipient: <str> Address of the Recipient
  # @param  amount: <int> Amount
  # @return <int> The index of the Block that will hold this transaction
  def append_transaction(sender:, recipient:, amount:)
    transaction = create_transaction(sender: sender, recipient: recipient, amount: amount)
    current_transactions.push(transaction)

    last_block.index
  end

  def compute_hash(_block)
  end

  def last_block
    chain[-1]
  end

  private

  Transaction = Struct.new(:sender, :recipient, :amount)
  Block = Struct.new(:index, :timestamp, :current_transactions, :proof, :previous_hash)

  def create_transaction(sender:, recipient:, amount:)
    Transaction.new(sender, recipient, amount)
  end

  def create_block(proof:, previous_hash:)
    Block.new(
      chain.length,
      Time.now.to_i,
      current_transactions,
      proof,
      previous_hash || compute_hash(last_block)
    )
  end
end