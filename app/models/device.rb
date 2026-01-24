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

end
