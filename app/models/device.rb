class Device < ApplicationRecord
  belongs_to :state, class_name: "DeviceState", optional: true
  has_many :device_states, dependent: :destroy
  has_many :commands, dependent: :destroy
end
