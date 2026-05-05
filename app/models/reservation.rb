class Reservation < ApplicationRecord
  validates :customer_name, presence: true
  validates :phone, presence: true
  validates :party_size, presence: true, numericality: { greater_than: 0, less_than_or_equal_to: 20 }
  validates :reservation_date, presence: true
  validates :reservation_time, presence: true

  scope :ordered, -> { order(reservation_date: :asc, reservation_time: :asc) }
  scope :pending, -> { where(status: "pending") }
  scope :confirmed, -> { where(status: "confirmed") }
  scope :upcoming, -> { where("reservation_date >= ?", Date.current) }

  STATUSES = %w[pending confirmed cancelled].freeze

  def status_color
    case status
    when "pending" then "bg-amber-100 text-amber-800"
    when "confirmed" then "bg-green-100 text-green-800"
    when "cancelled" then "bg-red-100 text-red-800"
    end
  end

  def formatted_date
    reservation_date&.strftime("%B %d, %Y")
  end

  def formatted_time
    reservation_time&.strftime("%l:%M %p")&.strip
  end
end
