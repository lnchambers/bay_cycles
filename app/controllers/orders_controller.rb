class OrdersController < ApplicationController

  def create
    if current_user
      redirect_to dashboard_path(current_user)
    else
      redirect_to login_path
    end
  end

end
