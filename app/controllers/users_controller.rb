class UsersController < ApplicationController

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
      redirect_to user_path(user)
    else
      render :new
    end
  end

  def update
    user = current_user
    user.update(user_params)
    if user.save
      redirect_to user_path(user)
    else
      render :edit
    end
  end

  private

    def user_params
      params.require(:user).permit(:username, :password)
    end
end
