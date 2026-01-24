class DeviceState < ApplicationRecord
  belongs_to :Device, optional: true


  scope :recent, ->(limit = 10) {
    order(created_at: :desc).limit(limit)
  }

end
