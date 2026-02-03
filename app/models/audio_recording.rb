class AudioRecording < ApplicationRecord
  belongs_to :device
  belongs_to :command, optional: true

  has_one_attached :audio

  validates :audio,
  attached: true,
  content_type: {
    in: %w[
      audio/mpeg
      audio/aac
      audio/mp4
      audio/ogg
      audio/x-wav
      audio/vnd.wave
      audio/webm
    ]
  }

  after_create_commit -> { broadcast_update_to_device }

  private

  def broadcast_update_to_device
    broadcast_replace_to "device_#{device_id}_audio",
                        target: "device_#{device_id}_audio",
                        partial: "devices/device_card_audio",
                        locals: { device: device }
  end
end
