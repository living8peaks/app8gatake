Rails.application.routes.draw do
  root 'static_pages#top'
  get  '/about',            to: 'static_pages#about'
  get  '/contact',          to: 'static_pages#contact'
  get  '/privacy_policy',   to: 'static_pages#privacy_policy'
  get  '/terms_of_service', to: 'static_pages#terms_of_service'
  get  '/signup',           to: 'users#new'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :users do
    member do
      get    :withdrawal_confirmation, :following, :followers
      delete :withdrawal_destroy
    end
  end
  resources :account_activations, only: [:edit]
  resources :password_resets, only: %i[new create edit update]
  resources :posts, only: %i[index show create destroy] do
    resources :comments, only: %i[create destroy]
    resources :likes, only: %i[create destroy]
  end
  resources :relationships, only: %i[create destroy]
end
