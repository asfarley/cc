class CreateDevices < ActiveRecord::Migration[8.0]
  def change
    create_table :devices do |t|
      t.string :name
      t.references :state, foreign_key: { to_table: :device_states}

      t.timestamps
    end
  end
end
