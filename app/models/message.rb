class Message < ApplicationRecord
  belongs_to :conversation
  belongs_to :user
  validates_presence_of :body, :conversation_id, :user_id
  def message_time
    created_at.strftime("%m/%d/%y at %l:%M %p")
  end

  def summary
    if body.length <= 100
      return body
    end
    body[0..150].gsub(/\s\w+\s*$/,'...')
  end

  def change
    @read = true
  end

  def title
    if body.length <= 30
      return body
    end
    body[0..30].gsub(/\s\w+\s*$/,'...')
  end
end
