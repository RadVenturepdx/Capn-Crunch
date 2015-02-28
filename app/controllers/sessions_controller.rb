class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_back_or root_url
    else
      flash[:danger] = 'Invalid email/password combination' # Not quite right!
      redirect_to :back
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
