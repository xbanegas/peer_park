class Reservation < ApplicationRecord
  belongs_to :vehicle
  belongs_to :space
  validates :space_id, :presence => true
  validates :vehicle_id, :presence => true
  scope :vehicle_by_user, -> (user) { where(vehicle: user.vehicles) }
  scope :space_by_user, -> (user) { where(space: user.spaces) }

	def self.date_sort reservations
    past_reservations = []
    reservations.each do |res|
      past_reservations << res if (res.start_time + res.duration.hours).past?
    end
    reservations -= past_reservations
    future_reservations = []
    reservations.each do |res|
      future_reservations << res if res.start_time.future?
    end
    current_reservations = reservations - future_reservations
    return {current: current_reservations, future: future_reservations, past: past_reservations}
  end

  def self.total reservations
    total = 0
    reservations.each { |res| total += res.amount }
    return total
  end

  def amount
    self.space.hourly_rate * self.duration
	end
	
	def print_time
		start_time = self.start_time.in_time_zone('Eastern Time (US & Canada)')
		start_time.strftime("%I:%M%p") + start_time.strftime(" on %m/%d/%Y")
	end

end
