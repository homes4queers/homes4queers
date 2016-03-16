class MessageMailer < ApplicationMailer

  def message_notification(user,url)
    #@user = User.find(@conversation.recipient_id), set in messages_controller
    @user= user
    @url = url
    mail(to: @user.email, subject: "You have a new message")
  end
end
