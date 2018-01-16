class CreateBlocks < ActiveRecord::Migration[5.1]
  def change
    create_table :blocks do |t|
      t.integer :proof, null: false
      t.string :previous_hash
      t.timestamps
    end
  end
end
