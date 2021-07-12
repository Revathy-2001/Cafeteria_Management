class SessionsController < ApplicationController
  skip_before_action :has_any_user_logged_in, except: [:destroy]

  # renders a sign in page
  def new
    render "new"
  end

  # checks for an existing user
  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      if (user.role == "user")
        session[:current_user_id] = user.id
        redirect_to categories_path
      elsif (user.role == "clerk")
        if (user.archived_by)
          flash[:error] = "Your Account is de-activated by admin!!"
          redirect_to new_sessions_path
        else
          session[:current_user_id] = user.id
          redirect_to clerks_path
        end
      else
        session[:current_user_id] = user.id
        redirect_to menu_categories_path
      end
    else
      flash[:error] = "Your Login attempt was Invalid!!"
      redirect_to new_sessions_path
    end
  end

  # singout functionality
  def destroy
    session[:current_user_id] = nil
    @current_user = nil
    redirect_to new_sessions_path
  end
end
