class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_unread_count

  def  set_unread_count
    if user_signed_in? && (Conversation.where(sender_id: current_user.id) || Conversation.where(recipient_id: current_user.id))
      @unread = 0
      @sender_conversations = Conversation.where(sender_id: current_user.id)
      @recipient_conversations = Conversation.where(recipient_id: current_user.id)
      @sender_conversations.each do |convo|
        convo.messages.each do |message|
          @unread += 1 if message.read == false && message.conversation.sender_id != current_user.id
        end
      end
      @recipient_conversations.each do |convo|
        convo.messages.each do |message|
          @unread += 1 if message.read == false && message.conversation.sender_id != current_user.id
        end
      end
      @unread
    end
  end


  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up) do |user|
      user.permit(:first_name, :last_name, :sport, :price_per_hour, :abilities_taught, :bio, :photo, :is_client, :photo_cache, :email, :password, :password_confirmation, locations_attributes: [:address])
    end

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update) do |user|
      user.permit(:first_name, :last_name, :sport, :price_per_hour, :abilities_taught, :bio, :photo, :photo_cache, :email, :password, :password_confirmation, locations_attributes: [:address])
    end
  end

  def default_url_options
    { host: ENV["HOST"] || "localhost:3000" }
  end
end
