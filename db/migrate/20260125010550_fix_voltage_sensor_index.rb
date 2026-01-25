class FixVoltageSensorIndex < ActiveRecord::Migration[8.0]
  def change
    add_column :device_states, :voltage_sensor8_mv, :float
    remove_column :device_states, :voltage_sensor9_mv, :float
  end
end
