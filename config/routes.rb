Rails.application.routes.draw do
  get 'withdrawals/new'
  root 'static_pages#top'
  get  '/about',            to: 'static_pages#about'
  get  '/contact',          to: 'static_pages#contact'
  get  '/privacy_policy',   to: 'static_pages#privacy_policy'
  get  '/terms_of_service', to: 'static_pages#terms_of_service'
  get  '/signup',           to: 'users#new'

  resources :users

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
end
