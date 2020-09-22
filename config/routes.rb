Rails.application.routes.draw do
  namespace :admin do
    root "top#index"
  end

  namespace :teacher do
    root "top#index"
    get "login" => "sessions#new", as: :login
    post "session" => "sessons#create" as: :session
    delete "session" => "sessions#destroy"
  end

  namespace :student do
    root "top#index"
  end
end