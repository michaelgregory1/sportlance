class UsersController < ApplicationController
  def Index
    @users = User.where(is_client: false)
  end

  def show
    @user = User.find(params[:id])
    @booking = Booking.new
    @booking.user_id = params[:id]
  end

  def map


    @locations = Location.where(user_id: @user.id)

    @markers = @locations.map do |location|
      {
        lng: location.longitude,
        lat: location.latitude
      }
    end
  end
end
