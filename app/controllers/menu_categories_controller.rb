class MenuCategoriesController < ApplicationController
  before_action :ensure_not_owner, only: [:categories]
  before_action :ensure_owner_logged_in, except: [:categories]

  # renders index.html.erb from view
  def index
    @menu_categories = MenuCategory.all
    render "index"
  end

  # creates a new category
  def create
    category_name = params[:name]
    status = params[:status].nil? ? "Inactive" : "Active"
    new_category = MenuCategory.new(
      :name => category_name.capitalize,
      :status => status,
    )
    if new_category.save
      redirect_to menu_categories_path
    else
      flash[:error] = new_category.errors.full_messages.join("\n")
      redirect_to menu_categories_path
    end
  end

  # updates a category name
  def update
    id = params[:id]
    name = params[:name]
    status = params[:status].nil? ? "Inactive" : "Active"
    category = MenuCategory.find(id)
    category.name = name
    category.status = status
    category.save!
    redirect_to menu_categories_path
  end

  # stores the id received in parameter and render the show edit from views
  def show_edit
    @id = params[:id]
    @category = MenuCategory.find(@id)
  end

  # deletes the existing category
  def destroy
    id = params[:id]
    category = MenuCategory.find(id)
    category.destroy
    redirect_to menu_categories_path
  end

  # renders categories view to customer
  def categories
    @menu_categories = MenuCategory.all
  end
end
