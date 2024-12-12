Rails.application.routes.draw do
  resources :car_parts

  namespace :seller do
    resources :car_parts
  end
  namespace :admin do
    resources :car_parts
    resources :sellers
    resources :customers
  end

  devise_for :customers
  devise_for :sellers
  devise_for :admins

  authenticated :admin_user do
    root to: "admin#index", as: :admin_root
  end
  authenticated :seller_user do
    root to: "seller#index", as: :seller_root
  end

  root "home#index"

  get "admin", to: "admin#index"
  get "seller", to: "seller#index"
  get "home", to: "home#index"
end
