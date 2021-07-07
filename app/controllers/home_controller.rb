class HomeController < ApplicationController
  skip_before_action :current_user

  def index
    if (current_user)
      if current_user.role == "user"
        redirect_to categories_path
      elsif current_user.role == "clerk"
        redirect_to clerks_path
      elsif current_user.role == "owner"
        redirect_to "/dashboard"
      end
    else
      render "index"
    end
  end
end
