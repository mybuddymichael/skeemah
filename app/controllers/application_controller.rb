class ApplicationController < ActionController::Base

  protect_from_forgery

  helper_method :current_user, :logged_in?

private

  def authenticate
    unless logged_in?
      redirect_to :root
    end
  end

  def current_user
    User.find(session[:id]) if session[:id]
  end

  def logged_in?
    session[:id]
  end

end
