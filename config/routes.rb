Rails.application.routes.draw do

  resource :search, only: [:show]

	resources :stores do

    member do
      post 'follow' => 'followings#create'
    end
    
    resources :products do
      member do
        post 'like' => 'likes#create'
        delete 'unlike' => 'likes#destroy'
      end
      resources :orders
    end
  	resource :dashboard, only: [:show]
  end

  resources :categories

  get '/index', to: 'pages#index'

  get '/contact', to: 'pages#contact'

  get '/about', to: 'pages#about'

  devise_for :users, controllers: {:registrations => 'users/registrations', confirmations: 'users/confirmations'}
  resources :users, only: [:show]

  root 'pages#index'
end
