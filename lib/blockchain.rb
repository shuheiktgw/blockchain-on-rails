class Blockchain

  attr_accessor :chain, :transactions

  def initialize
    @chain = []
    @transactions = []
  end

  # Create a new Block in the Blockchain
  # @param proof: <int> The proof given by the Proof of Work algorithm
  # @param previous_hash: (Optional) <str> Hash of previous Block
  # @return <Block> New Block
  def create_block(proof:, previous_hash: nil)

  end

  # Creates a new transaction to go into the next mined Block
  #
  # @param  sender: <str> Address of the Sender
  # @param  recipient: <str> Address of the Recipient
  # @param  amount: <int> Amount
  # @return <int> The index of the Block that will hold this transaction
  def append_transaction(sender:, recipient:, amount:)
    tr = create_transaction(sender: sender, recipient: recipient, amount: amount)
    transactions.push(tr)

    last_block.index
  end

  def hash(_block)
  end

  def last_block
    chain[-1]
  end

  private

  Transaction = Struct.new(:sender, :recipient, :amount)

  def create_transaction(sender:, recipient:, amount:)
    Transaction.new(sender, recipient, amount)
  end
end