class Testimonial < ApplicationRecord
  validates :customer_name, presence: true
  validates :quote, presence: true
  validates :stars, presence: true, inclusion: { in: 1..5 }

  scope :active, -> { where(active: true) }
  scope :featured, -> { where(featured: true) }
  scope :ordered, -> { order(created_at: :desc) }

  def star_display
    "★" * stars + "☆" * (5 - stars)
  end
end
