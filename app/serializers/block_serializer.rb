class BlockSerializer < ActiveModel::Serializer
  attributes :id, :proof, :previous_hash, :created_at, :updated_at, :transactions

  def transactions
    object.transactions
  end
end