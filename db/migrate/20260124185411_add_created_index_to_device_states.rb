class AddCreatedIndexToDeviceStates < ActiveRecord::Migration[8.0]
  def change
    add_index :device_states, [:device_id, :created_at]
  end
end
