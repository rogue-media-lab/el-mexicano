class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :menu_item

  validates :quantity, presence: true, numericality: { greater_than: 0 }
  validates :price, presence: true

  def subtotal
    price * quantity
  end

  def formatted_subtotal
    "$#{'%.2f' % subtotal}"
  end
end
