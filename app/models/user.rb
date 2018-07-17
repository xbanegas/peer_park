class User < ApplicationRecord
  validates :name, :uniqueness => true, :presence => true
end
