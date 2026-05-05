class CreateMealDeals < ActiveRecord::Migration[8.1]
  def change
    create_table :meal_deals do |t|
      t.string :name
      t.text :description
      t.decimal :price, precision: 8, scale: 2
      t.boolean :featured, default: false
      t.boolean :active, default: true
      t.references :main_item, null: false, foreign_key: { to_table: :menu_items }
      t.references :default_side, null: false, foreign_key: { to_table: :menu_items }
      t.references :default_drink, null: false, foreign_key: { to_table: :menu_items }

      t.timestamps
    end
  end
end
