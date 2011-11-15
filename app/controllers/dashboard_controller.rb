class DashboardController < ApplicationController

  def index
    if current_user
      render :index
    else
      render :splash
    end
  end

private

  def show_schemes

  end

end
