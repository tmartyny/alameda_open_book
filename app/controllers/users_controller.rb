class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    if user.save
      set_session
      redirect_to root_url, :notice => "Signed up!"
    else
      render "new"
    end
  end

  def show
  end

  private

  def user
    @user ||= User.new(user_params)
  end

  def set_session
    session[:user_id] = user.id
  end

  def user_params
    if params[:user].present?
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
  end
end