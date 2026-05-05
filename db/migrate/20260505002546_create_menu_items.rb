class CreateMenuItems < ActiveRecord::Migration[8.1]
  def change
    create_table :menu_items do |t|
      t.string :name
      t.text :description
      t.decimal :price, precision: 8, scale: 2
      t.boolean :featured, default: false
      t.boolean :active, default: true
      t.references :menu_category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
