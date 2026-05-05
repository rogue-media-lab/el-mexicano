class CreateOrders < ActiveRecord::Migration[8.1]
  def change
    create_table :orders do |t|
      t.string :customer_name
      t.string :phone
      t.time :pickup_time
      t.string :status, default: "pending"
      t.decimal :total, precision: 8, scale: 2

      t.timestamps
    end
  end
end
