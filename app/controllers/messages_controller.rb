class MessagesController < ApplicationController
  before_action do
   @conversation = Conversation.find(params[:conversation_id])
  end

  def index
    @messages = @conversation.messages
    if @messages.length > 10
      @over_ten = true
      @messages = @messages[-10..-1]
    end
    if params[:m]
      @over_ten = false
      @messages = @conversation.messages
    end
    if @messages.last
      if @messages.last.user_id != current_user.id
         @messages.last.read = true;
      end
    end
    @message = @conversation.messages.new
  end

  def new
   @message = @conversation.messages.new
  end

  def notification_mailer_user
    if @message.user_id == @conversation.sender_id
      @user = User.find(@conversation.recipient_id)
    else
      @user = User.find(@conversation.sender_id)
    end
  end

  def create
   @message = @conversation.messages.new(message_params)
     if @message.save
       MessageMailer.message_notification(notification_mailer_user).deliver_later
      redirect_to conversation_messages_path(@conversation)
    else
      redirect_back_or_to conversation_messages_path(@conversation), alert: "Say something to send something"
     end
  end

  private
   def message_params
    params.require(:message).permit(:body, :user_id)
   end
end
