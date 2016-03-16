class MessageMailer < ApplicationMailer

  def message_notification(user)
    #@user = User.find(@conversation.recipient_id), set in messages_controller
    @user= user
    @message = message
    mail(to: @user.email, subject: "You have a new message")
  end
end
