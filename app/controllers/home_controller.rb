class HomeController < ApplicationController
  skip_before_action :has_any_user_logged_in

  def index
    if (@current_user)
      if current_user.role == "user"
        redirect_to categories_path
      elsif current_user.role == "clerk"
        redirect_to clerks_path
      else
        redirect_to "/dashboard"
      end
    end
  end
end
