class MenuCategoriesController < ApplicationController

  # renders index.html.erb from view
  def index
    render "index"
  end

  # creates a new category
  def create
    category_name = params[:name]
    new_category = MenuCategory.new(
      :name => category_name,
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
    category_name = MenuCategory.find(id)
    category_name.name = name
    category_name.save!
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

  def categories
  end
end
