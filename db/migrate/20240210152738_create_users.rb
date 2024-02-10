class CreateUsers < ActiveRecord::Migration[7.2]
  def change
    create_table :users do |t|
      t.integer :fid
      t.string :address
      t.bigint :balance
      t.decimal :readable_balance, precision: 28, scale: 18

      t.timestamps
    end
  end
end
