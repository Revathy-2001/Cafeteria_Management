class UsersController < ApplicationController
  skip_before_action :current_user

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
      cart = Cart.new(user_id: user.id, date: DateTime.now)
      cart.save
      redirect_to categories_path
    else
      flash[:error] = user.errors.full_messages.join(", ")
      redirect_to "/users/new"
    end
  end

  def update
    user = User.find(params[:id])
    user_phone_no = user.phone_no
    if (params[:phone_no].length < 4 || params[:phone_no].length >= 12)
      user.phone_no = user_phone_no
    else
      user.phone_no = params[:phone_no]
    end
    user.save!
    redirect_to cart_items_path
  end
end
