class Photograph < ApplicationRecord
  belongs_to :Device
  has_one_attached :file
  
  after_commit :broadcast_photograph_update, on: [:create, :update]
  
  private
  
  def broadcast_photograph_update
    device = Device.find_by(id: self.Device_id)
    return unless device
    
    device.reload
    broadcast_replace_to(
      "devices",
      target: "device_#{device.id}_photograph",
      partial: "devices/device_card_photograph",
      locals: { device: device }
    )
  end
end
