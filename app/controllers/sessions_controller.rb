class SessionsController < ApplicationController
  def new
  end

  def create
    if authenticated_user?
      set_session
      redirect_to books_path
    else
      flash.now.alert = "Invalid email or password"
      render "new"
    end
  end

  def destroy
    remove_session
    redirect_to root_url, :notice => "Logged out!"
  end

  private

  def user
    @user ||= (User.find_by_email(user_params[:email]) if user_params[:email])
  end

  def set_session
    session[:user_id] = user.id
  end

  def remove_session
    session[:user_id] = nil
  end

  def authenticated_user?
    user && (user.authenticate(user_params[:password]) if user_params[:password])
  end

  def user_params
    params.permit(:email, :password)
  end
end