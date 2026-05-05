class MenuItem < ApplicationRecord
  belongs_to :menu_category
  has_one_attached :photo

  validates :name, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }

  scope :active, -> { where(active: true) }
  scope :featured, -> { where(featured: true) }
  scope :ordered, -> { order(created_at: :asc) }

  def formatted_price
    "$#{'%.2f' % price}"
  end
end
