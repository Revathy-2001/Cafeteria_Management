Rails.application.routes.draw do
  resources :menu_categories, :menu_items, :users, :carts, :cart_items, :addresses, :orders, :order_items

  get "/" => "home#index"
  get "/menu_items/new/:id" => "menu_items#new"
  get "/menu_items/show_update/:id" => "menu_items#show_update", as: :menuitems_update_view
  get "menu_categories/edit/:id" => "menu_categories#show_edit"

  get "signin" => "sessions#new", as: :new_sessions
  post "signin" => "sessions#create", as: :sessions
  delete "signout" => "sessions#destroy", as: :destroy_session
  get "categories" => "menu_categories#categories"
  post "update_profile" => "users#update_profile", as: :update_profile_path

  get "show_menu_items" => "menu_items#menu_items", as: :show_menu_items

  post "update_quantity/:act/:id" => "cart_items#update_quantity", as: :update_quantity
  delete "/delete_all_cart_items" => "cart_items#destroy_all", as: :destroy_all_cart_items

  put "delivery_address_change/:id" => "addresses#delivery_address_update"
  get "/order_details/:id" => "orders#admin_order_details", as: :admin_order_details
  get "/myorder_details/:id" => "orders#customer_order_details", as: :customer_order_details
  get "myorders/:id" => "orders#customer_orders", as: :customer_orders
  get "mark_as_delivered/:id" => "orders#mark_as_delivered", as: :mark_as_delivered
  get "create_new" => "users#create_new"
  get "clerks" => "users#clerks"
  get "clerk_checkout" => "cart_items#clerk_checkout", as: :clerk_checkout
  get "reports" => "orders#reports", as: :reports
  get "dashboard" => "orders#dashboard"
  post "cancel_order/:id" => "orders#cancel_order", as: :cancel_order
  get "/customer_reports" => "orders#customer_reports", as: :customer_reports
  get "/single_customer_reports" => "orders#single_customer_reports", as: :single_customer_reports
  get "/single_customer_view_details" => "orders#single_customer_view_details", as: :single_customer_view_details
end
