Rails.application.routes.draw do
  resources :menu_categories, :menu_items, :users

  get "/menu_items/new/:id" => "menu_items#new"
  get "/menu_items/show_update/:id" => "menu_items#show_update", as: :menuitems_update_view
  get "menu_categories/edit/:id" => "menu_categories#show_edit"

  get "signin" => "sessions#new", as: :new_sessions
  post "signin" => "sessions#create", as: :sessions
  delete "signout" => "sessions#destroy", as: :destroy_session
  get "categories" => "menu_categories#categories"
end
