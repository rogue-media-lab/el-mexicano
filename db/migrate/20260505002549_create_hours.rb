class CreateHours < ActiveRecord::Migration[8.1]
  def change
    create_table :hours do |t|
      t.integer :day_of_week
      t.time :open_time
      t.time :close_time
      t.boolean :closed, default: false

      t.timestamps
    end
  end
end
