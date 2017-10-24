Rails.application.routes.draw do
	resources :stores do
  	resources :products
  	resource :dashboard, only: [:show]
  end

  resources :categories

  get 'welcome/index'

  get 'welcome/contact'

  get 'welcome/about'

  devise_for :users


  root 'welcome#index'
end
