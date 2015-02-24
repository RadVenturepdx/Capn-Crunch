class MessagesController < ApplicationController
  def new
    @message = Message.new
  end

  def edit
  end

  def show
  end

  def create
    @message = Message.new(message_params)

    if @message.valid?
      if @message.subject
        MessageMailer.message_it(@message).deliver
        MessageMailer.message_user(@message).deliver
        flash[:success] = "Thank you for your message."
        redirect_to "/contact"
      else
        MessageMailer.ask_question(@message).deliver
        flash[:success] = "Thank you for your message."
        redirect_to :back
      end
    else
      redirect_to :back
    end
  end

  private
    def message_params
      params.require(:message).permit(:name, :email, :subject, :content)
    end

end
