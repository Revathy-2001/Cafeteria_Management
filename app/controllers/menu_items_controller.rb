class MenuItemsController < ApplicationController

  # renders the index page from view
  def index
  end

  # stores id received from parameter and renders the new page from views
  def new
    @id = params[:id]
  end

  # creates a new menu item to the exisiting category
  def create
    new_menu_item = MenuItem.new(
      :menu_category_id => params[:id],
      :name => params[:name],
      :description => params[:description],
      :price => params[:price],
    )
    if new_menu_item.save
      redirect_to menu_items_path
    else
      redirect_to menu_items_path
    end
  end

  # stores id from parameter and  renders show edit from views
  def show_update
    @menu_item_id = params[:id]
    @menu_item = MenuItem.find(@menu_item_id)
  end

  # updates the menu item
  def update
    menu_item = MenuItem.find(params[:id])
    menu_item.name = params[:name]
    menu_item.price = params[:price]
    menu_item.description = params[:description]
    menu_item.save!
    redirect_to menu_items_path
  end
end
