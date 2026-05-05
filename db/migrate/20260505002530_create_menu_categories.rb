class CreateMenuCategories < ActiveRecord::Migration[8.1]
  def change
    create_table :menu_categories do |t|
      t.string :name
      t.integer :sort_order, default: 0
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
