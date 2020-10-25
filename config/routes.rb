Rails.application.routes.draw do
  config = Rails.application.config.metis

  namespace :admin do
    root "top#index"
    get "login" => "sessions#new", as: :login
    post "session" => "sessions#create", as: :session
    delete "session" => "sessions#destroy"
  end

  constraints host: config[:teacher][:host]  do
    namespace :teacher , path: config[:teacher][:path] do
      root "top#index"
      get "login" => "sessions#new", as: :login
      resource :session, only: [ :create, :destroy ]
      resources :student_members
      resource :account, except: [ :new, :create, :destroy ]
    end
  end

  namespace :student do
    root "top#index"
    get "login" => "sessions#new", as: :login
    post "session" => "sessions#create", as: :session
    delete "session" => "sessions#destroy"
  end
end