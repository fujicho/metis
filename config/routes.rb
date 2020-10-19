Rails.application.routes.draw do
  namespace :admin do
    root "top#index"
    get "login" => "sessions#new", as: :login
    post "session" => "sessions#create", as: :session
    delete "session" => "sessions#destroy"
  end

  namespace :teacher do
    root "top#index"
    get "login" => "sessions#new", as: :login
    resource :session, only: [ :create, :destroy ]
    resources :student_members
    resource :account, except: [ :new, :create, :destroy ]
  end

  namespace :student do
    root "top#index"
    get "login" => "sessions#new", as: :login
    post "session" => "sessions#create", as: :session
    delete "session" => "sessions#destroy"
  end
end