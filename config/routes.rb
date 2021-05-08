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
      resources :student_members do
        resources :student_events, only: [:index]
      end
      resources :student_events, only: [:index]
      resource :account, except: [ :new, :create, :destroy ]
      resource :password, only: [ :show, :edit, :update]
      resources :board_messages do
        post :confirm, on: :collection
        patch :edit_confirm
      end
      resources :books
      #主に参考書、大学別過去問カテゴリの登録編集削除を行う
      resources :question do
        resources :answers, only: [:index, :new, :create, :edit,:update]
        #主に質問掲示板絵の投稿、リプライ、削除などを行う。
      end
    end
  end

  constraints  host: config[:student][:host]do
    namespace :student, path: config[:student][:path] do
      root "top#index"
      get "login" => "sessions#new", as: :login
      resource :session, only: [ :create, :destroy ]
      resource :account, except: [ :new, :create, :destroy ] do
        patch :confirm
      end
      resources :board_messages, only: [ :index]
      resources :questions, only: [ :index, :new, :create ] do
        post :confirm, on: :collection
      end
      delete "session" => "sessions#destroy"
    end
  end
end