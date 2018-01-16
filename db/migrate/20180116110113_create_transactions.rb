class CreateTransactions < ActiveRecord::Migration[5.1]
  def change
    create_table :transactions do |t|
      t.references :block
      t.string :sender, null: false
      t.string :recipient, null: false
      t.integer :amount, null: false

      t.timestamps
    end
  end
end
