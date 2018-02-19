class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = "Welcome, #{user.name}!"
      redirect_to dashboard_path
    else
      flash[:notice] = "Incorrect credentials. Try again."
      render :new
    end
  end

  def destroy
    session.destroy
    flash[:notice] = "You have successfully logged out"
    redirect_to root_path
  end
end
