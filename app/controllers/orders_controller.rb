class OrdersController < ApplicationController

  def create
    if current_user
      flash[:notice] = "You have successfully submitted your order"
      redirect_to dashboard_path(current_user)
    else
      redirect_to login_path
    end
  end

end
