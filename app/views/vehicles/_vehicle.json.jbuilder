json.extract! vehicle, :id, :user_id, :make, :model, :color, :license_plate, :created_at, :updated_at
json.url vehicle_url(vehicle, format: :json)
