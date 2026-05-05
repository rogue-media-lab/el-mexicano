class MealDeal < ApplicationRecord
  belongs_to :main_item, class_name: "MenuItem"
  belongs_to :default_side, class_name: "MenuItem"
  belongs_to :default_drink, class_name: "MenuItem"
  has_one_attached :photo

  validates :name, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }

  scope :active, -> { where(active: true) }
  scope :featured, -> { where(featured: true) }
  scope :ordered, -> { order(created_at: :asc) }

  def formatted_price
    "$#{'%.2f' % price}"
  end

  def savings
    individual_total = main_item.price + default_side.price + default_drink.price
    individual_total - price
  end

  def formatted_savings
    "$#{'%.2f' % savings.abs}"
  end

  def drink_options
    MenuItem.joins(:menu_category).where(menu_categories: { name: "Drinks" }).active.ordered
  end
end
