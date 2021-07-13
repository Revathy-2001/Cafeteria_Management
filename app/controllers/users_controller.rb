class UsersController < ApplicationController
  skip_before_action :has_any_user_logged_in, only: [:new, :create] # these two methods should execute even if no user logged in.
  before_action :ensure_not_customer, only: [:create_new, :all_users, :update_users_view, :update_user, :destroy_user] # customer should not view all these methods.
  before_action :ensure_clerk_logged_in, only: [:clerks] # this method is only accessible to clerks
  before_action :ensure_customer_logged_in, only: [:update] # this method is only accessible to customers

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
                    role: params[:role],
                    archived_by: false)
    if user.save
      # if owner tries to create any clerk,it will create a cart for the clerk and redirects to owner's homepage.
      if (@current_user && @current_user.role == "owner")
        if (user.role == "clerk")
          cart = Cart.new(user_id: user.id)
          cart.save
        end
        redirect_to "/dashboard"
      else
        # if any customers creates account, customer's id will be stored in cookie and cart will be created.
        session[:current_user_id] = user.id
        cart = Cart.new(user_id: user.id)
        cart.save
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
    user.phone_no = params[:phone_no]
    user.save!
    redirect_to cart_items_path
  end

  # shows a page to create other owners and clerks
  def create_new
    render "create_new"
  end

  # clerks home page
  def clerks
    render "clerks"
  end

  # renders page to show the list of users to owner
  def all_users
    render "all_users"
  end

  # renders view to update user
  def update_users_view
    @user = User.find(params[:id])
  end

  # updates the record
  def update_user
    user = User.find(params[:id])
    user.first_name = params[:first_name]
    user.phone_no = params[:phone_no]
    user.email = params[:email]
    user.save!
    redirect_to all_users_path
  end

  # destroys clerk
  def destroy_user
    user = User.find(params[:id])
    user.archived_by = true
    user.save!
    redirect_to all_users_path
  end
end
