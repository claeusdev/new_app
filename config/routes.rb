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
    end
  	resource :dashboard, only: [:show]
  end

  resources :categories

  get 'welcome/index'

  get 'welcome/contact'

  get 'welcome/about'

  devise_for :users, controllers: {:registrations => 'users/registrations'}
  resources :users, only: [:show]

  root 'pages#index'
end
