class Vehicle < ApplicationRecord
  belongs_to :user
  has_many :reservations
  validates :user_id, :make, :model, :color, :license_plate, :presence => true  
end
