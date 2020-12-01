Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'jobs#index'
  resources :languages, only: [:new, :create]
  resources :shifts, only: [:new, :create]
  resources :jobs, only: [:index, :new, :create] do
    collection do
      post :apply
    end
  end
end
