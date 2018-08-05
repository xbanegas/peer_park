class NewReservationWorker 
  include Sidekiq::Worker

	def perform_async(reservation)
    twilio_sid=ENV["TWILIO_API_SID"]
    twilio_token=ENV["TWILIO_API_TOKEN"]
    @client = Twilio::REST::Client.new twilio_sid, twilio_token
    
    parker = reservation.vehicle.user
    start_time =  reservation.print_time
    unless parker.cell_number.nil?
      parker_message = "You've reserved a space at #{reservation.space.make_address} for #{reservation.vehicle.license_plate}"\
        " starting at #{start_time} for #{reservation.duration} hours. "

      @client.api.messages.create(
        from: '+19548704155',
        to: '+1'+parker.cell_number,
        body: parker_message
      ) 
    end

    lister = reservation.space.user
    unless lister.cell_number.nil?
      lister_message = "Your space at #{reservation.space.make_address} was reserved by #{reservation.vehicle.license_plate}" \
      " starting at #{start_time} for #{reservation.duration} hours."

      @client.api.messages.create(
        from: '+19548704155',
        to: '+1'+lister.cell_number,
        body: lister_message 
      ) 
    end
  end
end
