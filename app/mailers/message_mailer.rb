class MessageMailer < ApplicationMailer
  def message_notification(user,conversation)
    @user = user
    @conversation = conversation
    mail(to: @user.email, subject: "You have a new message")
  end
end
