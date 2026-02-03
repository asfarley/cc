class VideoRecording < ApplicationRecord
  belongs_to :device
  belongs_to :command, optional: true

  has_one_attached :video

  validates :video,
    attached: true,
    content_type: {
      in: %w[
        video/mp4
        video/mpeg
        video/quicktime
        video/x-msvideo
        video/x-matroska
        video/webm
        video/x-flv
      ]
    }

  after_create_commit -> { broadcast_update_to_device }

  private

  def broadcast_update_to_device
    broadcast_replace_to "device_#{device_id}_video",
                        target: "device_#{device_id}_video",
                        partial: "devices/device_card_video",
                        locals: { device: device }
  end
end
