class MessagesController < ApplicationController
  def new
    @message = Message.new
  end

  def edit
  end

  def show
  end

  def index
    redirect_to root_url
  end

  def create
    @message = Message.new(message_params)

    if @message.valid?

      if @message.subject <=> "Question"
        MessageMailer.ask_question(@message).deliver
        MessageMailer.message_user(@message).deliver
        MessageMailer.message_it(@message).deliver
        flash[:success] = "Thank you for your message."
        redirect_to :back

      elsif !@message.subject.eql? "Question"
        MessageMailer.message_it(@message).deliver
        MessageMailer.message_user(@message).deliver
        flash[:success] = "Thank you for your message."
        redirect_to "/contact"
      end

    else
      flash[:danger] = "Message not valid"
      redirect_to root_url
    end
  end

  private
    def message_params
      params.require(:message).permit(:name, :email, :subject, :content, :recipient_name, :recipient_email)
    end

end
