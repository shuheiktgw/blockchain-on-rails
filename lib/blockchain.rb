require 'date'
require 'digest/sha2'

class Blockchain

  attr_accessor :chain, :current_transactions

  CORRECT_LAST_4_DIGITS = '0000'

  def initialize
    @chain = []
    @current_transactions = []

    # Create the genesis block
    append_block(proof: 100, previous_hash: 1)
  end

  # Create a new Block in the Blockchain
  #
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

  # Simple Proof of Work Algorithm:
  # Find a number p' such that compute_hash(pp') contains leading 4 zeroes, where p is the previous p'
  # p is the previous proof, and p' is the new proof
  #
  # @param last_proof: <int>
  # @return: <int>
  def compute_proof_of_work(last_proof)
    proof = 0
    until valid_proof?(last_proof: last_proof, proof: proof)
      proof += 1
    end

    proof
  end

  def last_block
    chain[-1]
  end

  private

  Transaction = Struct.new(:sender, :recipient, :amount) do
    def to_s
      "{ sender: #{ sender.to_s }, recipient: #{ recipient.to_s }, amount: #{ amount.to_s } }"
    end
  end

  Block = Struct.new(:index, :timestamp, :current_transactions, :proof, :previous_hash) do
    def to_s
      "{ index: #{ index.to_s }, timestamp: #{ timestamp.to_s }, current_transactions: #{ current_transactions.map(&:to_s).to_s }, proof: #{ proof.to_s }, previous_hash: #{ previous_hash.to_s } }"
    end
  end

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

  # Creates a SHA-256 hash of a given string
  #
  # @param   obj: <object> any object implemented to_s method
  # @return  <str> a SHA-256 hash of a object
  def compute_hash(obj)
    Digest::SHA256.hexdigest(obj.to_s)
  end

  # Validates the Proof: Does compute_hash(last_proof, proof) contain 4 leading zeroes?
  #
  # @param last_proof: <int> Previous Proof
  # @param proof:      <int> Current Proof
  # @return: <bool> True if correct, False if not.
  def valid_proof?(last_proof:, proof:)
    guess_hash = compute_hash(last_proof.to_s + proof.to_s)
    guess_hash[-4..-1] == CORRECT_LAST_4_DIGITS
  end
end