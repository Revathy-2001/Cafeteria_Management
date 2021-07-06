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
      cart = Cart.new(user_id: user.id, date: DateTime.now)
      cart.save
      if (user.role == "clerk")
        redirect_to clerks_path
      else
        redirect_to categories_path
      end
    else
      flash[:error] = user.errors.full_messages.join(", ")
      redirect_to "/users/new"
    end
  end

  def update_profile
    user = @current_user
    user.first_name = params[:first_name]
    user.phone_no = params[:phone_no]
    user.email = params[:email]
    user.save!
    if (user.role == "user")
      redirect_to categories_path
    elsif (user.role = "clerk")
      redirect_to clerks_path
    else
      redirect_to "/dashboard"
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

  def create_new
  end

  def clerks
  end
end
