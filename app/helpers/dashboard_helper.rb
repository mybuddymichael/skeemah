module DashboardHelper
  class IndexView < LayoutHelper::ApplicationView

    def username
      @current_user.username
    end

    def no_schemes
      @current_user.schemes.empty?
    end

  end
end
