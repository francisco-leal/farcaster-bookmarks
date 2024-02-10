class CreateTransfers < ActiveRecord::Migration[7.2]
  def change
    create_table :transfers do |t|
      t.references :user, null: false, foreign_key: true
      t.bigint :amount
      t.decimal :readable_amount, precision: 28, scale: 18
      t.string :tx_hash
      t.string :block_number
      t.string :status
      t.references :caster, null: true, foreign_key: {to_table: :users}

      t.timestamps
    end
  end
end
