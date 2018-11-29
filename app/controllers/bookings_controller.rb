class BookingsController < ApplicationController
  before_action :find_booking, only: [:show, :edit, :update, :destroy, :new]

  def index
    if params["count"].present?
      if params[:modifier] == "back"
        @modifier = params["count"].to_i
        @modifier -= 7
      elsif params[:modifier] == "forwards"
        @modifier = params["count"].to_i
        @modifier += 7
      end
    else
      @modifier = 0
    end
    @upcoming_bookings = []
    @past_bookings = []
    bookings = Booking.where(client_id: current_user.id)
    bookings.each do |b|
      @upcoming_bookings << b if b.date_start >= Time.now
      @past_bookings << b if b.date_start < Time.now
    end
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
    @booking.client_note = booking_params[:client_note]
    @booking.amount = calculate_total_price
    if @booking.save
      redirect_to new_booking_payment_path(@booking)
    else
      redirect_to user_path(params[:user_id])
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
    @user_clients = []
    @bookings.each do |booking|
      if booking.user == current_user
        @user_clients << User.find(booking.client_id)
      end
    end
    @clients = @user_clients.uniq
  end

  def change_calendar_backwards
    redirect_to user_bookings_path(params[:user][:value], count: params["count"], modifier: "back")
  end

  def change_calendar_forwards
    redirect_to user_bookings_path(params[:user][:value], count: params["count"], modifier: "forwards")
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
