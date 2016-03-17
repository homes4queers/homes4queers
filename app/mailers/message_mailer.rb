class MessageMailer < ApplicationMailer

  def message_notification(user,conversation)
    #@user = User.find(@conversation.recipient_id), set in messages_controller
    @user= user
    @conversation =  conversation
    mail(to: @user.email, subject: "You have a new message")
  end
end
