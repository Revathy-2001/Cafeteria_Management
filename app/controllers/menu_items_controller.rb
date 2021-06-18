class MenuItemsController < ApplicationController
  def index
  end

  def new
    @id = params[:id]
  end

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

  def show_update
    @menu_item_id = params[:id]
    @menu_item = MenuItem.find(@menu_item_id)
  end

  def update
    menu_item = MenuItem.find(params[:id])
    menu_item.name = params[:name]
    menu_item.price = params[:price]
    menu_item.description = params[:description]
    menu_item.save!
    redirect_to menu_items_path
  end
end
