class MessageMailer < ActionMailer::Base
  default from: "donotreply@radventurepdx.com"

  def message_it(msg)
    @msg = msg

    mail(to: 'radventureit@gmail.com', subject: "#{msg.name} #{msg.email} has sent a message", body: msg.content) do |format|
      format.html
      format.text
    end
  end

  def message_user(msg)
    @msg = msg

    mail(to: msg.email, subject: "Do Not Reply: Here is a copy of the message", body: msg.content) do |format|
      format.html
      format.text
    end
  end

  def ask_question(msg)
    @msg = msg

    mail(to: msg.recipient_email, subject: "#{msg.name} has a question for you", body: msg.content) do |format|
      format.html
      format.text
    end
  end

end
