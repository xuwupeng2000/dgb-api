Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      #manage customers
      resources :customers, expect: [:new, :edit]
      #manage products
      resources :products, expect: [:new, :edit]
      #manage orders
      resources :orders, expect: [:new, :edit]

      devise_scope :user do
        #login, log off
        resource :login, only: [:create, :destroy]
        #create account, update account, show profile
        resource :account, only: [:create, :update, :show]
      end
    end
  end

  namespace :admin do
    resources :users do
      resources :customers, module: :users
      resources :orders, module: :users
    end

    resources :products
  end

  root 'pages#welcome'

  devise_for :users, :controllers => { registrations: "registrations", sessions: "sessions"}

  devise_scope :user do
    post :sign_in, to: 'sessions#create'
    post :sign_up, to: 'registrations#create'
    post :reset_password, to: 'passwords#create'
    get  :logoff, to: 'sessions#destroy'
  end

end
