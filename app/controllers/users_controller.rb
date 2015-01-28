class UsersController < ApplicationController

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

    # the edit view will return 'false'
    if params[:changing_password] == 'false'
      params[:user].delete :password
      params[:user].delete :password_confirmation
      if @user.update_attributes(user_params)
        redirect_to @user
      else
        # rendering edit will change URL, possibly
        # breaking button to 'Change password' in 'edit' view
        # FIXME: correct URL in later version
        render 'edit'
      end

    # the change_password view will return 'true'
    else
      if @user.try(:authenticate, params[:current_password])
        # if the password box is blank, it is given a value that
        # will fail the minimum length test
        if params[:user][:password].blank?
          params[:user][:password] = 'a'
        end
        if @user.update_attributes(user_params)
          flash[:success] = 'Password changed'
          redirect_to :action => 'edit'
        else
          render 'change_password'
        end
      else
        flash[:danger] = "Current password is incorrect"
        render 'change_password'
      end
    end
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
        :profile,
        :address,
        :city,
        :state,
        :zipcode,
        :country
      )
    end

end
