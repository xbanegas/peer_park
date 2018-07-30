class NewReservationWorker 
  include Sidekiq::Worker

  def perform_async(reservation)
    twilio_sid=ENV["TWILIO_API_SID"]
    twilio_token=ENV["TWILIO_API_TOKEN"]
    @client = Twilio::REST::Client.new twilio_sid, twilio_token
    
    parker = reservation.vehicle.user
    unless parker.cell_number.nil?
      start_time =  reservation.start_time.strftime("%I:%M%p") + reservation.start_time.strftime(" on %m/%d/%Y") 
      parker_message = "You've reserved a space at #{reservation.space.make_address} for #{reservation.vehicle.license_plate}"\
        " starting at #{start_time} for #{reservation.duration} hour. "
      @client.api.messages.create(
        from: '+19548704155',
        to: '+1'+parker.cell_number,
        body: parker_message
      ) 
    end
  end
end
