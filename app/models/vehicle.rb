class Vehicle < ApplicationRecord
  belongs_to :user
  validates :user_id, :make, :model, :color, :license_plate, :presence => true  
end
