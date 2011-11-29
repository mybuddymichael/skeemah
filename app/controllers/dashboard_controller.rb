class DashboardController < ApplicationController

  def index
    if current_user
      @title = "#{current_user.username}'s dashboard - skeemah"
      render :index
    else
      render :splash
    end
  end

private

  def show_schemes

  end

end
