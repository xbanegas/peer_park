class ExpiredReservationWorker
  include Sidekiq::Worker

  twilio_sid=ENV["TWILIO_API_SID"]
  twilio_token=ENV["TWILIO_API_TOKEN"]
  twilio_secret=ENV["TWILIO_SECRET"]

  @client = Twilio::REST::Client.new twilio_token, twilio_secret, twilio_sid 
  puts @client
  def perform(*args)
    @client.messages.create(
      from: '+14159341234',
      to: '+13057535083',
      body: 'Hey there!'
    ) 
  end
end
