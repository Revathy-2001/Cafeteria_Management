class UsersController < ApplicationController
  skip_before_action :has_any_user_logged_in, only: [:new, :create]
  before_action :ensure_not_customer, only: [:create_new]
  before_action :ensure_clerk_logged_in, only: [:clerks]
  before_action :ensure_customer_logged_in, only: [:update]

  # renders signup page
  def new
    render "new"
  end

  # creates an new account for user
  def create
    user = User.new(first_name: params[:first_name],
                    phone_no: params[:phone_no],
                    email: params[:email],
                    password: params[:password],
                    role: params[:role])
    if user.save
      if (@current_user && @current_user.role == "owner")
        if (user.role == "clerk")
          cart = Cart.new(user_id: user.id, date: DateTime.now)
          cart.save
        end
        redirect_to "/dashboard"
      else
        session[:current_user_id] = user.id
        redirect_to categories_path
      end
    else
      flash[:error] = user.errors.full_messages.join(", ")
      redirect_to "/users/new"
    end
  end

  # updates profile for all the users
  def update_profile
    user = @current_user
    user.first_name = params[:first_name]
    user.phone_no = params[:phone_no]
    user.email = params[:email]
    user.save!
    if (user.role == "user")
      redirect_to categories_path
    elsif (user.role == "clerk")
      redirect_to clerks_path
    else
      redirect_to "/dashboard"
    end
  end

  # updates phone number of an user when ordering
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

  # shows a page to create other owners and clerks for owners
  def create_new
    render "create_new"
  end

  # clerks home page
  def clerks
    render "clerks"
  end
end
