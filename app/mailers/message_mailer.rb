class MessageMailer < ActionMailer::Base
  default from: "donotreply@radventurepdx.com"

  def message_user(msg)
    @msg = msg

    mail(to: msg.email, subject: "Do Not Reply: Here is a copy of the message", body: msg.content) do |format|
      format.html
      format.text
    end
  end
end
