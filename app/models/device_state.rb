class DeviceState < ApplicationRecord
  belongs_to :Device, optional: true

  after_commit :broadcast_update, on: [:create, :update]

  scope :recent, ->(limit = 10) {
    order(created_at: :desc).limit(limit)
  }

  private

  def broadcast_update
    # Find the device this state belongs to
    device = Device.find_by(id: self.Device_id)
    
    if device
      # Ensure the device's state_id points to this state (for newly created states)
      if device.state_id != self.id
        device.update_column(:state_id, self.id)
      end
      
      # Now eager load the associations we need for the partial
      # We reload the associations explicitly to ensure they're fresh
      device.reload  # Reload the entire device to get fresh association data
      device.photographs.reload
      device.device_states.reload
      
      # Broadcast a Turbo Stream update for this device
      broadcast_replace_to(
        "devices",
        target: "device_#{device.id}",
        partial: "devices/device_card",
        locals: { device: device }
      )
    end
  end
end
