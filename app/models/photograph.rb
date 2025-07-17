class Photograph < ApplicationRecord
  belongs_to :Device
  has_one_attached :file
end
