class Blockchain

  attr_accessor :chain, :transactions

  def initialize
    @chain = []
    @transactions = []
  end

  def create_block
  end

  # Creates a new transaction to go into the next mined Block
  # @param  sender: <str> Address of the Sender
  # @param  recipient: <str> Address of the Recipient
  # @param  amount: <int> Amount
  # @return <int> The index of the Block that will hold this transaction
  def append_transaction(sender:, recipient:, amount:)
    transactions.push(Transaction.new(sender, recipient, amount))
    last_block.index
  end

  def hash(_block)
  end

  def last_block
    chain[-1]
  end

  private

  Transaction = Struct.new(:sender, :recipient, :amount)
end