class User < ApplicationRecord
  validates :email, :uniqueness => true, :presence => true
  has_many :reservations, :dependent => :destroy
  has_many :spots, :dependent => :destroy
end
