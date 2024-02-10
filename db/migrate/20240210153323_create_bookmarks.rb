class CreateBookmarks < ActiveRecord::Migration[7.2]
  def change
    create_table :bookmarks do |t|
      t.references :user, null: false, foreign_key: true
      t.string :cast
      t.bigint :caster_id
      t.references :transfer, null: true, foreign_key: true

      t.timestamps
    end
  end
end
