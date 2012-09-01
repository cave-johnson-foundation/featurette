class SessionsController < ApplicationController
  def create
    auth = request.env["omniauth.auth"]
    user = User.find_or_create_with_omniauth(auth)
    session[:user_id] = user.id
    redirect_to root_url
  end

  def failure
    redirect_to root_url, :alert => 'Could not authenticate, sorry.'
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "User logged out."
  end
end
