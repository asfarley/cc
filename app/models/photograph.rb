class Photograph < ApplicationRecord
  belongs_to :device, class_name: "Device", foreign_key: "Device_id"
  has_one_attached :file
  
  after_commit :broadcast_photograph_update, on: [:create, :update]
  
  private
  
  def broadcast_photograph_update
    logger.info "Attempting to broadcast photograph update"
    
    unless device
      logger.info "device is null, cannot broadcast photograph."
      return
    end
    
    logger.info "Broadcasting device photograph update..."
    device.reload
    broadcast_replace_later_to(
      "devices",
      target: "device_#{device.id}_photograph",
      partial: "devices/device_card_photograph",
      locals: { device: device }
    )
  end
end
