class CreateAppSettings < ActiveRecord::Migration[7.2]
  def change
    create_table :app_settings do |t|
      t.integer :casts_last_processed_timestamp
      t.boolean :casts_processing

      t.timestamps
    end
  end
end
