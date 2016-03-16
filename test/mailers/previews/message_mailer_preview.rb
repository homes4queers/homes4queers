# Preview all emails at http://localhost:3000/rails/mailers/message_mailer
class MessageMailerPreview < ActionMailer::Preview
  def message_notification
    user = User.find(2)
    url = Conversation.first.messages.all
    MessageMailer.message_notification(user, @url)
  end
end
