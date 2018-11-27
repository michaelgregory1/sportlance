class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up) do |user|
      user.permit(:first_name, :last_name, :sport, :price_per_hour, :abilities_taught, :bio, :photo, :is_client, locations: [:address])
    end

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update) do |user|
      user.permit(:first_name, :last_name, :sport, :price_per_hour, :abilities_taught, :bio, :photo, locations: [:address])
    end
  end

  def default_url_options
    { host: ENV["HOST"] || "localhost:3000" }
  end
end
