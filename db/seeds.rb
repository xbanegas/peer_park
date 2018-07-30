
require 'faker'
Faker::Config.locale = 'en-US'

space_seeds = JSON.parse(File.read('db/seed.json'))

seed_size = 100

plates=[]
until plates.size==seed_size do
  p="#{rand(899)+100}#{('A'..'Z').to_a.sample(3).join}"
  plates<<p unless p=~/69|666|ASS|SHT|KKK/
end



seed_size.times do |num|
  lon = space_seeds[num] ? space_seeds[num]["coords"][0] : nil
  lat = space_seeds[num] ? space_seeds[num]["coords"][1] : nil 

  availability = Array.new(7).map{(rand 2).zero?}

  u = User.create(
 
    email: Faker::Internet.email,
    password: Faker::Internet.password(8),
    encrypted_password: Faker::Internet.password(8),
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    cell_number: Faker::PhoneNumber.cell_phone
  )
  s = Space.create(
    user_id: u.id,
    state: Faker::Address.state_abbr,
    avail_m: availability[0],
    avail_t: availability[1], 
    avail_w: availability[2],
    avail_th: availability[3],
    avail_f: availability[4],
    avail_sa: availability[5],
    avail_su: availability[6],
    hourly_rate: rand(5) * 100,
    latitude: lat,
    longitude: lon
  )
  s.update(
    address: Faker::Address.street_address,
    city: Faker::Address.city,
    zip: Faker::Address.zip,
  )

  Vehicle.create(
    user_id: u.id,
    make: Faker::Vehicle.make,
    model: Faker::Vehicle.model,
    color: Faker::Vehicle.color,
    license_plate: plates[num]
  )
end