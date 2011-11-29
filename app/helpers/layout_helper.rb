module LayoutHelper
  class MainLayoutView

    attr_reader :current_user

    def initialize(current_user)
      @current_user = current_user
    end

  end
end
