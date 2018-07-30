class Space < ApplicationRecord
  belongs_to :user
  has_many :reservations
  has_one_attached :parking_spot_image
  geocoded_by :make_address
  after_validation :geocode, if: :needs_geocode?

  validates :state, :presence => true

  def make_address
    [address, city, state, zip.to_s].compact.reject(&:empty?).join(', ')
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

  def needs_geocode?
    return true if latitude.nil? && longitude.nil?
    return false
  end

end
