class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :search_results]

  def index
    @users = User.where(is_client: false)
  end

  def show
    @user = User.find(params[:id])
    @booking = Booking.new
    @booking.user_id = params[:id]
  end

  def search_results
    @query = params[:query]
    @users = User.global_search(params[:query])
    map(@users)
    redirect_to no_results_path if @users.empty?
  end

  private

  def map(users)
    users.each do |user|
      if Location.where(address: @query).exists?
        search_place = Location.where(address: @query)
        @markers = user.locations.map do |place|
          if place.address == search_place[0].address
            {
              lng: place.longitude,
              lat: place.latitude,
              infoWindow: { content: render_to_string(partial: "/users/map_window", locals: { user: User.find(place.user_id) }) }
            }
          end
        end
      else
        @markers = user.locations.map do |place|
          {
            lng: place.longitude,
            lat: place.latitude,
            infoWindow: { content: render_to_string(partial: "/users/map_window", locals: { user: User.find(place.user_id) }) }
          }
        end
      end
    end
    @markers.compact!
  end
end
