Rails.application.routes.draw do
  devise_for :customers
  devise_for :sellers
  devise_for :admins

  authenticated :admin_user do
    root to: "admin#index", as: :admin_root
  end

  root "home#index"

  get "admin", to: "admin#index"
end
