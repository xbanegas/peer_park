class ExpiredReservationWorker
  include Sidekiq::Worker

  twilio_sid=ENV["TWILIO_API_SID"]
  twilio_token=ENV["TWILIO_API_TOKEN"]
  twilio_secret=ENV["TWILIO_SECRET"]

  def perform(*args)
    twilio_sid=ENV["TWILIO_API_SID"]
    twilio_token=ENV["TWILIO_API_TOKEN"]
    twilio_secret=ENV["TWILIO_SECRET"]
    @client = Twilio::REST::Client.new twilio_sid, twilio_token
    @client.api.messages.create(
      from: '+19548704155',
      to: '+13057535083',
      body: 'Hey there!'
    ) 
  end
end
