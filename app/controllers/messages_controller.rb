class MessagesController < ApplicationController
  def new
    @message = Message.new
  end

  def edit
  end

  def show
    redirect_to "/contact"
  end

  def index
    redirect_to "/contact"
  end

  def create
    @message = Message.new(message_params)

    if @message.valid?
      case
      when @message.subject.match("Question") && !@message.recipient_name.match("user")
        MessageMailer.ask_question(@message).deliver
        MessageMailer.message_user(@message).deliver
        MessageMailer.message_it(@message).deliver
        flash[:success] = "Your message has been sent. Thank you!"
        redirect_to :back
      else
        MessageMailer.message_it(@message).deliver
        MessageMailer.message_user(@message).deliver
        flash[:success] = "Thank you for contacting us."
        redirect_to "/contact"
      end
    else
      flash[:danger] = "Invalid Message."
      redirect_to root_url
    end
  end

  private
    def message_params
      params.require(:message).permit(:name, :email, :subject, :content, :recipient_name, :recipient_email)
    end

end
