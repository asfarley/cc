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
    
    if file.attached?
      image_url = Rails.application.routes.url_helpers.rails_blob_path(file, only_path: true)
      
      broadcast_update_to(
        "devices",
        target: "device_#{device.id}_photograph_img",
        html: %(<img src="#{image_url}" class="photograph" data-action="photograph-update#loadComplete" />)
      )
    end
  end
end
