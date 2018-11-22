class AvailabilitiesController < ApplicationController
  def index
    @availabilities = Availability.all
  end

  def new
    @availability = Availability.new
  end

  def create
    @availability = Availability.new(availability_params)
    @availability.user = current_user
    if @availability.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    @availability = Availability.find(params[:id])
    @availability.destroy
  end

  def toggle_availability
    time = (params[:time][:value]).to_datetime + 1.second

    if Availability.exists?(date_start: time - 1.hour, date_end: time, user_id: current_user.id)
      a = Availability.find_by(date_start: time - 1.hour, date_end: time, user_id: current_user.id)
      a.destroy
    else
      Availability.create(date_start: time - 1.hour, date_end: time, user_id: current_user.id)
    end
  end

  private

  def availability_params
    params.require(:availability).permit(:date_start, :date_end)
  end
end
