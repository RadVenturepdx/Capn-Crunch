class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update, :change_password]
  before_action :correct_user,   only: [:edit, :update, :change_password]

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to Radventure"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if params[:user][:password].nil?
      if @user.update(user_params)
        flash[:success] = 'Profile has been updated'
        redirect_to @user
      else
        render 'edit'
      end
    else
      if not @user.authenticate(params[:current_password])
        flash.now[:danger] = 'Your current password is not valid'
        render 'change_password'
      else
        if params[:user][:password].blank?
          flash.now[:danger] = 'No new password entered'
          render 'change_password'
        elsif params[:user][:password] != params[:user][:password_confirmation]
          flash.now[:danger] = 'New password does not match confirmation'
          render 'change_password'
        elsif @user.update(user_params)
          flash[:success] = 'Your password has been updated'
          redirect_to @user
        else
          render 'change_password'
        end
      end
    end
  end

  def change_password
    @user = User.find(params[:id])
  end

  # Confirms a logged-in user.
  def logged_in_user
    unless logged_in?
      store_location
      flash.now[:danger] = "Please log in."
      redirect_to login_url
    end
  end

  # Confirms the correct user.
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end

  private

    def user_params
      params.require(:user).permit(
        :name,
        :email,
        :phone_number,
        :age,
        :password,
        :password_confirmation,
        :profile,
        :address,
        :city,
        :state,
        :zipcode,
        :country
      )
    end

end
