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
    
    # Broadcast summary (battery, active status)
    broadcast_replace_to(
      "devices",
      target: "device_#{device.id}_summary",
      partial: "devices/device_card_summary",
      locals: { device: device }
    )
    
    # Broadcast device state content (preserves <details> state)
    broadcast_replace_to(
      "devices",
      target: "#{ActionView::RecordIdentifier.dom_id(self)}_content",
      partial: "device_states/device_state_content",
      locals: { device_state: self }
    )
  end
end
