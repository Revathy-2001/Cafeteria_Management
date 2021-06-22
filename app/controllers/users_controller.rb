class UsersController < ApplicationController
  def new
  end

  def create
    user = User.new(first_name: params[:first_name],
                    phone_no: params[:phone_no],
                    email: params[:email],
                    password: params[:password],
                    address: params[:address],
                    role: params[:role])
    if user.save
      render plain: "Created"
    else
      render plain: "Not created"
    end
  end
end
