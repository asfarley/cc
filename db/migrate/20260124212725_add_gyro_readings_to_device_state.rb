class AddGyroReadingsToDeviceState < ActiveRecord::Migration[8.0]
  def change
    add_column :device_states, :gx1, :float
    add_column :device_states, :gy1, :float
    add_column :device_states, :gz1, :float
    add_column :device_states, :gx2, :float
    add_column :device_states, :gy2, :float
    add_column :device_states, :gz2, :float
    add_column :device_states, :gx3, :float
    add_column :device_states, :gy3, :float
    add_column :device_states, :gz3, :float
  end
end
