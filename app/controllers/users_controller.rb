class UsersController < ApplicationController
  before_action :require_login, except: [:new, :create]

  def new
    @user = User.new
  end

  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      flash[:notice] = "Welcome, #{user.name}!"
      redirect_to dashboard_path
    else
      render :new
    end
  end

  def update
    user = current_user
    if user.update(user_params)
      if current_admin?
        redirect_to admin_dashboard_path
      else
        redirect_to dashboard_path
      end
    else
      render :edit
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password)
    end
end
