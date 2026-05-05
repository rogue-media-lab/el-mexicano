class ReservationsController < ApplicationController
  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(reservation_params)
    if @reservation.save
      redirect_to contact_path, notice: "Reservation request submitted! We'll confirm shortly."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:customer_name, :phone, :party_size, :reservation_date, :reservation_time, :special_requests)
  end
end
