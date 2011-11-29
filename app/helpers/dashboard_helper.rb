module DashboardHelper
  # The view for the dashboard/index template.
  class IndexView < LayoutHelper::ApplicationView

    # Returns a string of the current user's username.
    def username
      @current_user.username
    end

    # Returns true if the current user has not created or forked any schemes.
    def no_schemes
      @current_user.schemes.empty?
    end

  end
end
