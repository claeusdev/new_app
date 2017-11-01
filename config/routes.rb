Rails.application.routes.draw do

  resource :search, only: [:show]

  
  
	resources :stores do
    resources :products
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
