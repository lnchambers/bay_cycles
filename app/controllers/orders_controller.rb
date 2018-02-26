class OrdersController < ApplicationController

  def new
    if current_user

    else
      flash[:notice] = "Please login first"
      redirect_to login_path
    end
  end

  def create
    if current_user
      flash[:notice] = "You have successfully submitted your order"
      redirect_to dashboard_path(current_user)
    else
      redirect_to login_path
    end
  end

end
