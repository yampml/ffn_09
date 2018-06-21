Rails.application.routes.draw do
  root "static_pages#home"
  get "static_pages/home"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  get "/signup", to: "users#new"
  post "/signup", to: "users#create"
  resources :users

  get "auth/:provider/callback", to: "sessions#create"
  get "auth/failure", to: redirect("/")
  get "login_google", to: redirect("/auth/google_oauth2"), as: "login_google"
  get "login_facebook", to: redirect("/auth/facebook"), as: "login_facebook"

  resources :news, only: :show
  get "admincp/show"
  scope "/admincp/" do
    resources :news, except: :show
  end

  mount Ckeditor::Engine => "/ckeditor"
end
