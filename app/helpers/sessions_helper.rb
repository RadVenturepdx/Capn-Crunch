module SessionsHelper
  def log_in(user)
    session[:user_id] = user.id
    guide = Guide.find_by(user_id: user.id)
    if !guide.nil?
      session[:guide_id] = guide.id
    end
  end

  def current_guide
    @current_guide ||= Guide.find_by(id: session[:guide_id])
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def current_guide?(guide)
    guide == current_guide
  end

  def current_user?(user)
    user == current_user
  end

  def is_guide?
    !current_guide.nil?
  end

  def logged_in?
    !current_user.nil?
  end

  def log_out
    session.delete(:user_id)
    if !:guide_id.nil?
      session.delete(:guide_id)
      @current_guide = nil
    end
    @current_user = nil
  end

  # Redirects to stored location (or to the default).
  def redirect_back_or(default)
    redirect_to(session[:forwarding_url] || default)
    session.delete(:forwarding_url)
  end

  # Stores the URL trying to be accessed.
  def store_location
    session[:forwarding_url] = request.url if request.get?
  end

  # Confirms a logged-in user.
  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end

  def already_signed_up
    unless !current_user
      flash[:danger] = "Already signed up!"
      redirect_to home_path
    end
  end

  # Confirms the correct user.
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end

  # Confirms the correct guide.
  def correct_guide
    @guide = Guide.find(params[:id])
    redirect_to(root_url) unless current_guide?(@guide )
  end
end
