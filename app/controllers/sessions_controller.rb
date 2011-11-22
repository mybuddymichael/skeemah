class SessionsController < ApplicationController

  def create
    auth_hash = request.env['omniauth.auth']
    user = User.find_or_create_with_omniauth(auth_hash)
    session[:id] = user.id
    redirect_to root_url
  end

  def destroy
    session[:id] = nil
    redirect_to root_url
  end

end
