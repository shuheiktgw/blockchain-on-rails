class Transaction < ApplicationRecord
  belongs_to :block

  # Creates a new transaction to go into the next mined Block
  #
  # @param  sender: <str> Address of the Sender
  # @param  recipient: <str> Address of the Recipient
  # @param  amount: <int> Amount
  # @return <int> The index of the Block that will hold this transaction
  def self.append_transaction!(sender:, recipient:, amount:)
    block = Block.last
    block.transactions.create!(sender: sender, recipient: recipient, amount: amount)
    block.id
  end



end
