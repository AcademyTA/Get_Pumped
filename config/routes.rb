Rails.application.routes.draw do
  root "dashboards#index"

  devise_for :users, controllers: { registrations: 'registrations' }

  resources :users do
    resources :exercises
  end

  resources :dashboards, only: [:index] do
    collection do
      post :search, to: 'dashboards#search'
    end
  end

  resources :friendships, only: [:show, :create, :destroy]
end
