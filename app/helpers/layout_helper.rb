module LayoutHelper
  # ApplicationView is the application's layout view, corresponding to
  # views/layouts/application.html.erb.
  class ApplicationView

    # Initialize the view and pass along the current_user, which is in
    # ApplicationController.
    def initialize(current_user)
      @current_user = current_user
    end

    # Returns the logged-in user, or nil if none.
    attr_reader :current_user

  end
end
