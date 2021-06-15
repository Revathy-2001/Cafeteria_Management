class MenuCategoriesController < ApplicationController
  def index
    render "index"
  end

  def create
    category_name = params[:name]
    new_category = MenuCategory.new(
      :name => category_name,
    )
    if new_category.save
      redirect_to menu_categories_path
    else
      redirect_to menu_categories_path
    end
  end

  def update
    id = params[:id]
    name = params[:name]
    category_name = MenuCategory.find(id)
    category_name.name = name
    category_name.save!
    redirect_to menu_categories_path
  end

  def destroy
    id = params[:id]
    category = MenuCategory.find(id)
    category.destroy
    redirect_to menu_categories_path
  end
end
