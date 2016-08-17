class Owner::BookingsController < ApplicationController
  def index
    @places = current_user.places
    @pending_bookings = Booking.where(place: @places).where(status: 0)
    @confirmed_bookings = Booking.where(place: @places).where(status: 1)
    @rejected_bookings = Booking.where(place: @places).where(status: 2)
  end

  def edit
    @places = current_user.places
    @booking = Booking.where(place: @places).find(params[:id])
    @booking.status = 1
    @booking.save
    redirect_to owner_bookings_path
  end

end
