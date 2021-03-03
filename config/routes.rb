Rails.application.routes.draw do
  get 'password_resets/new'
  get 'password_resets/edit'
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
      get    'withdrawal_confirmation'
      delete 'withdrawal_destroy'
    end
  end

  resources :account_activations, only: [:edit]

  resources :password_resets,     only: %i[new create edit update]
end
