class CreateSpaces < ActiveRecord::Migration[5.2]
  def change
    create_table :spaces do |t|
      t.references :user, foreign_key: true
      t.string :address
      t.string :city
      t.string :state
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
