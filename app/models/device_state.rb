class DeviceState < ApplicationRecord
  belongs_to :Device, optional: true

  after_commit :broadcast_update, on: [:create, :update]

  scope :recent, ->(limit = 10) {
    order(created_at: :desc).limit(limit)
  }

  private

  def broadcast_update
    device = Device.find_by(id: self.Device_id)
    return unless device
    
    device.update_column(:state_id, self.id) if device.state_id != self.id
    
    # Summary is now handled client-side via device_liveness_controller.js
    
    # Broadcast telemetry pane to update GPS coordinates and trigger map update
    broadcast_replace_to(
      "devices",
      target: "device_#{device.id}_telemetry",
      partial: "devices/device_card_telemetry",
      locals: { device_state: self, device: device }
    )
    
    # Broadcast individual section updates to preserve <details> state
    sections = %w[info location imu configuration temperature environmental battery 
                  esc cell wifi network heaters rangefinders solar io text]
    
    sections.each do |section|
      broadcast_replace_to(
        "devices",
        target: "device_#{device.id}_#{section}",
        partial: "device_states/device_#{section}",
        locals: { device_state: self }
      )
    end
  end
end
