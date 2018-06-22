Rails.application.routes.draw do
  root "static_pages#home"
  get "static_pages/home"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  get "/signup", to: "users#new"
  post "/signup", to: "users#create"
  get "auth/:provider/callback", to: "sessions#create"
  get "auth/failure", to: redirect("/")
  get "login_google", to: redirect("/auth/google_oauth2"), as: "login_google"
  get "login_facebook", to: redirect("/auth/facebook"), as: "login_facebook"
  get "admincp/show"

  resources :users
  resources :teams, except: %i(edit new)
  resources :news, only: :show
  resources :comments, only: %i(create destroy)
  resources :players, only: %i(index create)
  get "admincp/show"

  scope "/admincp/" do
    resources :news, except: :show
    resources :teams, except: %i(show destroy index)
    resources :players, only: :new
    get "/players", to: "players#index", as: "admin_players"
    get "/teams", to: "teams#index", as: "admin_teams"
  end

  mount Ckeditor::Engine => "/ckeditor"
end
