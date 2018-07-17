class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :spot
  validates :spot_id, :presence => true
  validates :spot_id, :presence => true

end
