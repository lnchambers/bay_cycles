class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_cart

  helper_method :current_user, :current_admin?, :has_trips?, :made_with_adjective, :made_with_nouns

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

  def has_trips?
    !Trip.all.empty?
  end

  def set_cart
    @cart ||= Cart.new(session[:cart])
  end

  def made_with_adjective
    [
      "Malicious", "Careful", "Overflowing", "Changing", "Different",
      "Revolving", "Generous", "Pure", "Random", "Fortunate",
      "Goliath", "Some", "5 Year Old's", "General", "Xenoplastic", "Ellen's",
      "Luis'", "Luke's"
    ]
  end

  def made_with_nouns
    [
      "Forethought", "Minelaying", "Love", "Intentions", "Ideas",
      "Pinatas", "Crocodiles", "Coffee", "Arrays", "Cookies",
      "Trucks", "Code", "Help", "Kenobis", "Morphology", "Positivity",
      "Artistic Genius", "Ideaologies"
    ]
  end
end
