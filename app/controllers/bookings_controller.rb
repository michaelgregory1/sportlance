class BookingsController < ApplicationController
  before_action :find_booking, only: [:show, :edit, :update, :destroy, :new]

  def index
    @bookings = Booking.all
    @user = current_user
  end

  def show
    calculate_total_price
    if current_user.is_client?
      @recipient = User.find(@booking.user_id)
    else
      @recipient = User.find(@booking.client_id)
    end
  end

  def new
  end

  def create
    @booking = Booking.new
    date_start = booking_params[:date_start].scan(/\w{1,5}\s+\d{1,2},\s+\d{1,2}:\d\d\s[A-Z][A-Z]/)[0]
    date_end = booking_params[:date_start].scan(/\w{1,5}\s+\d{1,2},\s+\d{1,2}:\d\d\s[A-Z][A-Z]/)[1]
    @booking.date_start = Time.parse(date_start)
    @booking.date_end = Time.parse(date_end)
    @booking.user_id = params[:user_id]
    @booking.client_id = current_user.id
    @booking.location_id = booking_params[:location_id]
    @booking.amount = calculate_total_price
    if @booking.save
      redirect_to new_booking_payment_path(@booking)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @booking.update(booking_params)
    @booking.amount = calculate_total_price
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :edit
    end
  end

  def destroy
    @booking.destroy
    redirect_to user_bookings_path(current_user)
  end

  def redirect_to_show
    p "HELLO"
    time = (params[:time][:value]).to_datetime + 1.second
    booking = Booking.find_by(date_start: time - 1.hour, date_end: time, user_id: current_user.id)
    render js: "window.location = '/bookings/#{booking.id}'"
  end

  def clients
    @bookings = Booking.all
  end

  private

  def booking_params
    params.require(:booking).permit(:date_start, :location_id, :client_note, :user_id)
  end

  def find_booking
    @booking = Booking.find(params[:id])
  end

  def find_user
    @user = User.find(params[:user_id])
  end

  def calculate_total_price
    @price = @booking.user.price_per_hour * ((@booking.date_end - @booking.date_start) * 0.000277778).floor
  end
end
