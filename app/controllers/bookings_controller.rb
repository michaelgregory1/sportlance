class BookingsController < ApplicationController
   before_action :find_booking, only: [:show, :edit, :update, :destroy]

  def index
    @bookings = Booking.all
  end

  def show
    calculate_total_price
  end

  def new
    @user = find_user
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = find_user
    @booking.client = current_user
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :new
    end
  end

  def edit
    @user = find_user
  end

  def update
    @booking.update(booking_params)
    # redirect_to TBC
  end

  def destroy
    @booking.destroy
    # redirect_to TBC
  end

  private

  def booking_params
    params.require(:booking).permit(:date_start, :date_end, :user_id, :client_id, :location_id, :client_note, :user_note)
  end

  def find_booking
    @booking = Booking.find(params[:id])
  end

  def find_user
    User.find(params[:user_id])
  end

  def calculate_total_price
    @price = @booking.user.price_per_hour * ((@booking.date_end - @booking.date_start) * 0.000277778).floor
  end

end
