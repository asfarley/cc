class Device < ApplicationRecord
  belongs_to :state, class_name: "DeviceState", optional: true
  has_many :device_states, dependent: :destroy
  has_many :commands, dependent: :destroy
  has_many :photographs, dependent: :destroy

  def latest_photograph
    if photographs.count == 0
      return nil
    end
    latest_photograph = photographs.sort_by { |p| p.created_at }.last
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
