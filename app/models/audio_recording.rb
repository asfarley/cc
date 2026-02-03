class AudioRecording < ApplicationRecord
  belongs_to :device
  belongs_to :command, optional: true

  has_one_attached :audio

  validates :audio, attached: true,
                  content_type: %w[audio/mpeg audio/wav audio/x-wav audio/mp4 audio/aac audio/ogg]
end
