class SessionsController < ApplicationController
  def new 

  end
  def create #handles post request on login path
    user = User.find_by(username: params[:session][:username])
    isAuthenticated = user && user.authenticate(params[:session][:password])
    if !isAuthenticated
      flash[:alarm] = "Wrong credentials"
      redirect_to login_path
      return
    end
    session[:user_id] = user.id
    flash[:success] = "Succesfuly login in"
    redirect_to root_path
  end
  
  def destroy
    session[:user_id] = nil
    flash[:success] = "You have successfully logged out"
    redirect_to login_path
  end
end
