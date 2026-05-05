class CreateReservations < ActiveRecord::Migration[8.1]
  def change
    create_table :reservations do |t|
      t.string :customer_name
      t.string :phone
      t.integer :party_size
      t.date :reservation_date
      t.time :reservation_time
      t.text :special_requests
      t.string :status, default: "pending"

      t.timestamps
    end
  end
end
