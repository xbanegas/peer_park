class Space < ApplicationRecord
  belongs_to :user
  has_many :reservations
  validates :state, :presence => true
  geocoded_by latitude: :latitude, longitude: :longitude 


  def has_valid_state
    states = ["AL", "AR", "AZ", "CA", "CO", "CT", "DE", "DC", "FL", "GA", "HI", "ID", "IL", "IN", "IA", "KS", "KY", "LA", "ME", "MD", "MA", "MI", "MN", "MS", "MO", "MT", "NE", "NV", "NH", "NJ", "NM", "NY", "NC", "ND", "OH", "OK", "OR", "PA", "RI", "SC", "SD", "TN", "TX", "UT", "VT", "VA", "WA", "WV", "WI", "WY"]
    unless states.include?(self.state)
      self.state = ""
      return false
    end
    return true
  end

end
