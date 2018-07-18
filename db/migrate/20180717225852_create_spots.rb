class CreateSpots < ActiveRecord::Migration[5.2]
  def change
    create_table :spots do |t|
      t.references :user, foreign_key: true
      t.string :address_1, :null => false
      t.string :address_2, :null => false
      t.string :city, :null => false
      t.string :state, :null => false
      t.integer :zip
      t.string :size
      t.boolean :avail_m
      t.boolean :avail_t
      t.boolean :avail_w
      t.boolean :avail_th
      t.boolean :avail_f
      t.boolean :avail_sa
      t.boolean :avail_su
      t.integer :hourly_rate
      t.text :description

      t.timestamps
    end
  end
end
