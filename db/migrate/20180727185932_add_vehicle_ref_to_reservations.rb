class AddVehicleRefToReservations < ActiveRecord::Migration[5.2]
  def change
    add_reference :reservations, :vehicle, foreign_key: true
  end
end
