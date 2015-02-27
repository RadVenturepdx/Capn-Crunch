class UsersController < ApplicationController
  include SessionsHelper
  before_action :logged_in_user, only: [:edit, :show, :update, :change_password]
  before_action :correct_user,   only: [:edit, :show, :update, :change_password]

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
    if params['Upload This Avatar']
      flash[:success] = 'Avatar Uploaded'
    elsif params[:user][:password].nil?
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

  def upload_avatar
    @user = User.find(params[:id])
  end

  def avatar_upload
    @user = User.find(params[:id])
    api = Gravatar.new(@user.email, :password => params[:g_password])
    if api.exists?
      api.save_data!('PG', params[:avatar])
      flash[:success] = 'Your avatar has been uploaded'
    end
    redirect_to home_url
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
        :country,
      )
    end

  def avatar_params
    params.require().permit(:g_password, :avatar)
  end

end
