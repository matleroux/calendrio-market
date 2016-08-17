class BookingsController < ApplicationController
  def index
    @pending_bookings = Booking.where(user: current_user).where(status: 0)
    @confirmed_bookings = Booking.where(user: current_user).where(status: 1)
    @rejected_bookings = Booking.where(user: current_user).where(status: 2)
  end
  def show
    @booking = Booking.find(params[:id])
  end

  def new
  end

  def create
    # Get hidden field from places#show
    # Form value is sending booking[:field] cause of @booking
    @place = Place.find(params[:booking][:place_id])
    @user = current_user
    @booking = Booking.new(booking_params)
    @booking.place = @place
    @booking.user = @user
    @booking.status = 0
    @booking.save
    redirect_to bookings_path
  end

  def edit
  end
  def update
  end

  def destroy
  end

  private
  def booking_params
    params.require(:booking).permit(:start_time, :duration, :number_of_participants, :place_id)
  end
end


