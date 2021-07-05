Rails.application.routes.draw do
  resources :menu_categories, :menu_items, :users, :carts, :cart_items, :addresses, :orders, :order_items

  get "/menu_items/new/:id" => "menu_items#new"
  get "/menu_items/show_update/:id" => "menu_items#show_update", as: :menuitems_update_view
  get "menu_categories/edit/:id" => "menu_categories#show_edit"

  get "signin" => "sessions#new", as: :new_sessions
  post "signin" => "sessions#create", as: :sessions
  delete "signout" => "sessions#destroy", as: :destroy_session
  get "categories" => "menu_categories#categories"

  get "show_menu_items/:id" => "menu_items#menu_items", as: :show_menu_items

  post "update_quantity/:act/:id" => "cart_items#update_quantity", as: :update_quantity
  delete "/delete_all_cart_items" => "cart_items#destroy_all", as: :destroy_all_cart_items

  put "delivery_address_change/:id" => "addresses#delivery_address_update"
  get "/order_details/:id" => "orders#order_details", as: :order_details
  get "myorders/:id" => "orders#customer_orders", as: :customer_orders
  get "mark_as_delivered/:id" => "orders#mark_as_delivered", as: :mark_as_delivered
end
