class Hour < ApplicationRecord
  validates :day_of_week, presence: true, inclusion: { in: 0..6 }, uniqueness: true

  scope :ordered, -> { order(day_of_week: :asc) }

  DAY_NAMES = %w[Sunday Monday Tuesday Wednesday Thursday Friday Saturday].freeze

  def day_name
    DAY_NAMES[day_of_week]
  end

  def formatted_hours
    return "Closed" if closed?
    "#{open_time&.strftime('%l:%M %p')&.strip} – #{close_time&.strftime('%l:%M %p')&.strip}"
  end
end
