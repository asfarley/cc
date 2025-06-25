class CreateDevices < ActiveRecord::Migration[8.0]
  def change
    create_table :devices do |t|
      t.string :name
      t.references :state, null: false, foreign_key: true

      t.timestamps
    end
  end
end
