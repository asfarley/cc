include ActionView::Helpers::DateHelper

class Device < ApplicationRecord
  belongs_to :state, class_name: "DeviceState", optional: true
  has_many :device_states, dependent: :destroy
  has_many :commands, dependent: :destroy
  has_many :photographs, dependent: :destroy
  has_many :audio_recordings, dependent: :destroy
  has_many :video_recordings, dependent: :destroy

  # Enable Turbo Streams broadcasts for this model
#  broadcasts_to ->(device) { "devices" }, inserts_by: :append

  def latest_photograph
    photographs.order(created_at: :desc).first
  end

  def latest_audio_recording
    audio_recordings.order(created_at: :desc).first
  end

  def latest_video_recording
    video_recordings.order(created_at: :desc).first
  end


  def recent_device_states(limit = 10)
    device_states.recent(limit)
  end


  def active?
    last_state = device_states.last
    if last_state.nil?
      return false
    end

    if last_state.created_at >= 10.minutes.ago
      return true
    end

    return false
  end

  def last_telemetry_time
    last_state = device_states.last
    if last_state.nil?
      return nil
    end
    return Time.current - last_state.created_at
  end

  def last_telemetry_time_h 
    last_state = device_states.last
    if last_state.nil?
      return nil
    end
    return distance_of_time_in_words(last_state.created_at,Time.current, include_seconds: true)
  end

  def main_battery_percentage
    last_state = device_states.last
    if last_state.nil?
      return "?"
    end
    if last_state.battery1_percent.nil?
      return "?"
    end
    return last_state.battery1_percent
  end

  def main_battery_voltage
    last_state = device_states.last
    if last_state.nil?
      return "?"
    end
    if last_state.battery1_v.nil?
      return "?"
    end
    return last_state.battery1_v
  end

end
