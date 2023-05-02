class CreateRentals < ActiveRecord::Migration[7.0]
  def change
    create_table :rentals do |t|
      t.references :bike, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.integer :start_station_id
      t.integer :end_station_id
      #t.datetime :created_at, precision: 6, null: false
      #t.datetime :updated_at, precision: 6, null: false
      t.integer :price
      t.index [:bike_id, :user_id]
      t.index [:user_id, :bike_id]
      
      t.timestamps
    end
  end
end
