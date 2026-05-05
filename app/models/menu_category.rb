class MenuCategory < ApplicationRecord
  has_many :menu_items, dependent: :destroy

  validates :name, presence: true, uniqueness: true

  scope :active, -> { where(active: true) }
  scope :ordered, -> { order(sort_order: :asc) }
end
