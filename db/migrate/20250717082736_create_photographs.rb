class CreatePhotographs < ActiveRecord::Migration[8.0]
  def change
    create_table :photographs do |t|
      t.belongs_to :Device, null: false, foreign_key: true

      t.timestamps
    end
  end
end
