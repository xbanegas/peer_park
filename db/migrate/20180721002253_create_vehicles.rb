class CreateVehicles < ActiveRecord::Migration[5.2]
  def change
    create_table :vehicles do |t|
      t.references :user, foreign_key: true
      t.string :make, null: false
      t.string :model, null: false
      t.string :color, null: false
      t.string :license_plate, null: false

      t.timestamps
    end
  end
end
