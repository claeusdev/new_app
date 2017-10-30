Rails.application.routes.draw do

  resource :search, only: [:show]

  
  resources :products do
    collection do
      get 'autocomplete'
    end
  end
  
	resources :stores do
  	resource :dashboard, only: [:show]
  end

  resources :categories

  get 'welcome/index'

  get 'welcome/contact'

  get 'welcome/about'

  devise_for :users
  resources :users, only: [:show]

  root 'pages#index'
end
