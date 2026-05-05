class CreateTestimonials < ActiveRecord::Migration[8.1]
  def change
    create_table :testimonials do |t|
      t.string :customer_name
      t.text :quote
      t.integer :stars
      t.boolean :featured, default: false
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
