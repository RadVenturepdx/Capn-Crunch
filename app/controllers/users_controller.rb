class UsersController < ApplicationController
  include SessionsHelper
  before_action :logged_in_user,    only: [:edit, :show, :update, :change_password, :transaction_history]
  before_action :correct_user,      only: [:edit, :show, :update, :change_password, :transaction_history]
  before_action :already_signed_up, only: [:new]

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if not params[:user][:country] == 'United States of America'
      params[:user][:state] = "None"
    end
    if @user.save
      log_in @user
      flash[:success] = "Welcome to Radventure"
      redirect_to home_url
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
      if not params[:user][:country] == 'United States of America'
        params[:user][:state] = "None"
      end
      if @user.update(user_params)
        flash[:success] = 'Profile has been updated'
        render 'edit'
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
          flash.now[:success] = 'Your password has been updated'
          render 'edit'
        else
          render 'change_password'
        end
      end
    end
  end

  def transaction_history
    @user_reservations = Reservation.where(user_id: current_user.id)
    if is_guide?
      @guide_reservations = Reservation.where(guide_id: current_guide.id)
    end
  end

  def review
    @user = User.find(params[:id])
    @guide = Guide.find_by(user_id: @user.id)
    @reservation = Reservation.find_by(user_id: current_user.id, guide_id: @guide.id)

    @review = Review.new
  end

  def change_password
    @user = User.find(params[:id])
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
        :address,
        :city,
        :state,
        :zipcode,
        :country
      )
    end

end

