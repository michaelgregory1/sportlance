class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :search_results, :new_instructor]

  def index
    @users = User.where(is_client: false)
  end

  def show
    @user = User.find(params[:id])
    @booking = Booking.new
    @booking.user_id = params[:id]
    @availabilities = []
    @reviews = @user.reviews

    @total = 0
    @reviews.each do |review|
      @total += review.rating.to_i
    end
    if @reviews.length > 0
    @user_average_review = @total / @reviews.length
    end

    @user.availabilities.each do |availability|
      @availabilities << availability
    end
    if user_signed_in? && current_user.is_client
      if current_user.is_client?
        @recipient = User.find(@booking.user_id)
      else
        @recipient = User.find(@booking.client_id)
      end
    end
  end

  def search_results
    @query = params[:query]
    @users = User.global_search(params[:query])
    map(@users)
    redirect_to no_results_path if @users.empty?
  end

  def new_instructor
    @user = User.new
    @location = Location.new
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
    @markers.compact! if @markers != nil
  end
end
