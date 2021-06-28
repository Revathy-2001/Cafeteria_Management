class UsersController < ApplicationController
  def new
  end

  def create
    user = User.new(first_name: params[:first_name],
                    phone_no: params[:phone_no],
                    email: params[:email],
                    password: params[:password],
                    role: params[:role])
    if user.save
      session[:current_user_id] = user.id
      redirect_to categories_path
    else
      flash[:error] = new_user.errors.full_messages.join(", ")
      redirect_to "/users/new"
    end
  end
end
