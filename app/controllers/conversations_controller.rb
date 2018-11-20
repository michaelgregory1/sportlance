class ConversationsController < ApplicationController
  before_action :authenticate_user!
  def index
    all_conversations = Conversation.all
    @conversations = find_conversations(all_conversations)
  end

  def create
    if Conversation.between(params[:sender_id], params[:recipient_id]).present?
      @conversation = Conversation.between(params[:sender_id], params[:recipient_id]).first
    else
      @conversation = Conversation.new(conversation_params)
      @conversation.sender = current_user
      @conversation.save
    end
    redirect_to conversation_messages_path(@conversation)
  end

  private

  def conversation_params
    params.require(:conversation).permit(:recipient_id)
  end

  def find_conversations(all_conversations)
    conversations = []
    all_conversations.each do |conversation|
      if conversation.sender_id == current_user.id || conversation.recipient_id == current_user.id
        conversations << conversation
      end
    end
    return conversations
  end
end
