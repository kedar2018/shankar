Rails.application.routes.draw do
  # Admin/auth
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  # Public
  root "home#index"

  resources :events,  only: [:index, :show]        # /events, /events/:slug
  resources :temples, only: [:index, :show]        # /temples, /temples/:slug
  resources :quotes,  only: [:index]               # /quotes
  resources :photos,  only: [:index]               # /photos

  # Pages by slug (e.g., /biography, /teachings)
  get "/:slug", to: "pages#show", as: :page
end
