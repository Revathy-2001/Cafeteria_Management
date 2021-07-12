class MenuItemsController < ApplicationController
  before_action :ensure_not_owner, only: [:menu_items]
  before_action :ensure_owner_logged_in, except: [:menu_items]

  # renders the index page from view
  def index
    @menu_categories = MenuCategory.all
  end

  # stores id received from parameter and renders the new page from views
  def new
    @id = params[:id]
  end

  # creates a new menu item to the exisiting category
  def create
    new_menu_item = MenuItem.new(
      :menu_category_id => params[:id],
      :name => params[:name].capitalize,
      :description => params[:description],
      :price => params[:price],
      :status => params[:status],
    )
    if new_menu_item.save
      redirect_to menu_items_path
    else
      flash[:error] = new_menu_item.errors.full_messages.join("\n")
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
    status = params[:status].nil? ? "Inactive" : "Active"
    menu_item.name = params[:name]
    menu_item.price = params[:price]
    menu_item.description = params[:description]
    menu_item.status = status
    menu_item.save!
    redirect_to menu_items_path
  end

  # destroys the menu item
  def destroy
    id = params[:id]
    menu_item = MenuItem.find(id)
    menu_item.destroy
    redirect_to menu_items_path
  end

  # renders menu item page for customers
  def menu_items
    @id = params[:id]
    if (@id.nil?)
      @menu_category = MenuCategory.find_by(status: "Active")
      unless (@menu_category.nil?)
        @id = @menu_category.id
      end
    else
      @menu_category = MenuCategory.find(@id)
    end
  end
end
