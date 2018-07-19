class Spot < ApplicationRecord
  belongs_to :user
  has_many :reservations

  attr_reader :user_id
end
