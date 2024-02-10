class CreateAirdrops < ActiveRecord::Migration[7.2]
  def change
    create_table :airdrops do |t|
      t.references :user, null: false, foreign_key: true
      t.string :tx_hash

      t.timestamps
    end
  end
end
