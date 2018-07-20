class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.references :user, foreign_key: true, :null=>false
      t.references :space, foreign_key: true, :null=>false
      t.datetime :start_time, :null=>false
      t.boolean :confirmed, :default => false
      t.boolean :paid, :default => false

      t.timestamps
    end
  end
end