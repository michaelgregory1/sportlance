class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :search_results, :new_instructor, :no_results, :availabilities]

  def index
    @users = User.where(is_client: false)
  end

  def availabilities
    @user = User.find(params[:id])
    @booking = Booking.new
    @booking.user_id = params[:id]
    @availabilities = user_availabilities(@user)
    respond_to do |format|
      format.js
    end
  end

  def show
    @user = User.find(params[:id])
    @booking = Booking.new
    @booking.user_id = params[:id]
    @calendar_availabilities = []
    @user.availabilities.each do |availability|
      @calendar_availabilities << availability.date_start.strftime("%Y-%m-%d")
    end
    @calendar_availabilities_uniq = @calendar_availabilities.uniq
    @calendar_availabilities_uniq = false if @calendar_availabilities_uniq.empty?
    @availabilities = []
    if user_signed_in? && current_user.is_client
      if current_user.is_client?
        @recipient = User.find(@booking.user_id)
      else
        @recipient = User.find(@booking.client_id)
      end
    end

    @reviews = @user.reviews
    @total = 0
    @reviews.each do |review|
      @total += review.rating.to_i
    end
    if @reviews.length > 0
      @user_average_review = (@total / @reviews.length.to_f).ceil
    end
  end

  def search_results
    @query = params[:query]
    @locations = Location.near(@query, 3)
    if @locations.empty?
      @users = User.global_search(params[:query])
    else
      @users_located = []
      @locations.each do |location|
        @users_located << User.find(location.user_id)
      end
      @users = @users_located.uniq
    end
    map(@users, @locations)
    redirect_to no_results_path if @users.empty?
  end

  def new_instructor
    @user = User.new
    @user.locations.build
  end

  private

  def map(users, search_locations)
    unless search_locations.empty?
      places = search_locations
      @markers = places.map do |place|
        {
          lng: place.longitude,
          lat: place.latitude,
          infoWindow: { content: render_to_string(partial: "/users/map_window", locals: { user: User.find(place.user_id) }) }
        }
      end
    else
      @markers = []
      users.each do |user|
        user.locations.each do |place|
          @markers <<
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

  def user_availabilities(user)
    availabilities = []
    user.availabilities.each do |availability|
      if availability.date_start.strftime("%Y-%m-%d") == params[:date]
        availabilities << availability
      end
    end
    return availabilities
  end
end
