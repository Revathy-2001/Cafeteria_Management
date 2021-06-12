class MenuCategoriesController < ApplicationController
  def index
    render "index"
  end

  def create
  end

  def destroy
    id = params[:id]
    category = MenuCategory.find(id)
    category.destroy
    redirect_to menu_categories_path
  end
end
