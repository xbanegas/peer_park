class Reservation < ApplicationRecord
  belongs_to :vehicle
  belongs_to :space
  validates :space_id, :presence => true
  validates :vehicle_id, :presence => true
end
