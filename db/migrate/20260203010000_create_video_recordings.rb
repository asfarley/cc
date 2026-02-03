class CreateVideoRecordings < ActiveRecord::Migration[8.0]
  def change
    create_table :video_recordings do |t|
      t.references :device, null: false, foreign_key: true
      t.references :command, null: true, foreign_key: true
      t.datetime :recorded_at
      t.integer :duration_seconds

      t.timestamps
    end
  end
end
