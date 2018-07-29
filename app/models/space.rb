class Space < ApplicationRecord
  belongs_to :user
  has_many :reservations
  has_one_attached :parking_spot_image
  geocoded_by :geocode_method
  after_validation :geocode, if: :needs_geocode?

  validates :state, :presence => true
  # geocoded_by latitude: :latitude, longitude: :longitude

  def make_address
    [address, city, state, "us"].compact.reject(&:empty?).join(', ')
  end

  def has_valid_state
    states = ["AL", "AR", "AZ", "CA", "CO", "CT", "DE", "DC", "FL", "GA", "HI", "ID", "IL", "IN", "IA", "KS", "KY", "LA", "ME", "MD", "MA", "MI", "MN", "MS", "MO", "MT", "NE", "NV", "NH", "NJ", "NM", "NY", "NC", "ND", "OH", "OK", "OR", "PA", "RI", "SC", "SD", "TN", "TX", "UT", "VT", "VA", "WA", "WV", "WI", "WY"]
    unless states.include?(self.state)
      self.state = ""
      return false
    end
    return true
  end

  private
  def geocode_method
    make_address
  end
  def needs_geocode?
    if address.present?
      true
    else
      latitude.nil? && longitude.nil?
    end
  end

end
