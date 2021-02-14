Rails.application.routes.draw do
  get 'static_pages/top'
  get 'static_pages/about'
  get 'static_pages/contact'
  root 'application#hello'
end
