class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @booking = Booking.new
    @booking.user_id = params[:id]
  end
end
