class ApplicationController < ActionController::Base
  # before_action :has_any_user_logged_in
  before_action :current_user

  # def has_any_user_logged_in
  #   unless current_user
  #     redirect_to "/"
  #   end
  # end

  # def ensure_user_logged_in
  #   unless current_user.role == "user"
  #     render :file => "#{Rails.root}/public/404.html", layout: false, status: :not_found
  #   end
  # end

  # def ensure_admin_logged_in
  #   unless current_user.role == "owner"
  #     render :file => "#{Rails.root}/public/404.html", layout: false, status: :not_found
  #   end
  # end

  # def ensure_clerk_logged_in
  #   unless current_user.role == "clerk"
  #     render :file => "#{Rails.root}/public/404.html", layout: false, status: :not_found
  #   end
  # end

  # check which user has currently logged in
  def current_user
    return @current_user if @current_user

    current_user_id = session[:current_user_id]
    if (current_user_id)
      @current_user = User.find(current_user_id)
    else
      nil
    end
  end
end
