class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :spot
  validates :user_id, :presence => true
  validates :spot_id, :presence => true
end
