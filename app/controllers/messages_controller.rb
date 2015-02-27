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
      when @message.subject.match("Question")
        MessageMailer.ask_question(@message).deliver
        MessageMailer.message_user(@message).deliver
        MessageMailer.message_it(@message).deliver
        flash[:success] = "Thank you for your message."
        redirect_to :back
      when !@message.subject.match("Question")
        MessageMailer.message_it(@message).deliver
        MessageMailer.message_user(@message).deliver
        flash[:success] = "Thank you for contacting us."
        redirect_to "/contact"
      else
        flash[:danger]="Invalid Message!"
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
