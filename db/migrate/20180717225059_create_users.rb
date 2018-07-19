class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.boolean :spot_owner
      t.string :vehicle_make
      t.string :vehicle_model
      t.string :vehicle_color
      t.string :vehicle_license

      t.timestamps
    end
  end
end
