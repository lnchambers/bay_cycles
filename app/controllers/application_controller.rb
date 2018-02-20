class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :current_admin?, :made_with

  def require_admin
    render file: "/public/404" unless current_admin?
  end

  def require_user
    render file: "/public/404" unless current_user
  end

  def require_login
    flash[:notice] = "Please log in first" unless current_user
    redirect_to login_path unless current_user
  end

  def current_user
  @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_admin?
    current_user && current_user.admin?
  end

  def made_with
    [
    "Malice of Forethought", "Careful Minelaying", "Overflowing Love", "Changing Intentions", "Different Ideas",
    "Revolving Pinatas", "Generous Crocodiles", "Pure Coffee", "Random Arrays", "Fortunate Cookies",
    "Goliath Trucks", "Some Code", "5 Year Old's Help", "General Kenobi", "Xenoplastic Morphology", "Ellen's Positivity",
    "Luis' Artistic Genius", "Luke's Ideaologies"
    ]
  end
end
