class SessionsController < ApplicationController
  def new
  end

  def create
    
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      @user = user
      redirect_to user_path(user.id)
    else
      flash.now[:alert] = "Email or password is invalid"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    if user
      redirect_to login_path, notice: "Logged out!"
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :password)
  end
end
