class UsersController < ApplicationController
  def index
    @users = User.where(is_client: false)
    map(@users)
  end

  def show
    @user = User.find(params[:id])
    @booking = Booking.new
    @booking.user_id = params[:id]
  end

  private

  def map(users)
    users.each do |user|
      @markers = user.locations.map do |place|
        {
          lng: place.longitude,
          lat: place.latitude,
          infoWindow: { content: render_to_string(partial: "/users/map_window", locals: { user: User.find(place.user_id) }) }
        }
      end
    end
  end
end
