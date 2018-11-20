class AvailabilitiesController < ApplicationController
  def index
    @availabilities = Availability.all
  end

  def new
    @availability = Availability.new
  end

  def create
    @availability = Availability.new(availability_params)
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

  private

  def availability_params
    params.require(:availability).permit(:date_start, :date_end, :user)
  end

end
