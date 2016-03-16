class Message < ActiveRecord::Base
  belongs_to :conversation
  belongs_to :user

  validates_presence_of :body, :conversation_id, :user_id

  def message_time
    created_at.to_formatted_s(:long)
  end

  def notification_mailer_user
    if @message.user_id == @conversation.sender_id
      @user = User.find(@conversation.recipient_id)
    else
      @user = User.find(@conversation.sender_id)
    end
  end

  def convo
    @conversation.messages
  end

  def send_notifications!
    MessageMailer.message_notification(notification_mailer_user, convo).deliver_later
  end

end
