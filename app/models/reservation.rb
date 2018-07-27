class Reservation < ApplicationRecord
  belongs_to :vehicle
  belongs_to :space
  belongs_to :user
  validates :user_id, :presence => true
  validates :space_id, :presence => true
end
