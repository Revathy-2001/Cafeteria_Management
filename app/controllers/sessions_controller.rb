class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:current_user_id] = user.id
      if (user.role == "user")
        redirect_to categories_path
      elsif (user.role == "clerk")
        redirect_to clerks_path
      else
        redirect_to menu_categories_path
      end
    else
      flash[:error] = "Your Login attempt was Invalid!!"
      redirect_to new_sessions_path
    end
  end

  def destroy
    session[:current_user_id] = nil
    # @current_user = nil
    redirect_to new_sessions_path
  end
end
