class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :space
  validates :user_id, :presence => true
  validates :space_id, :presence => true
end
