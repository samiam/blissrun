Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'home#home'

  get 'home', to: 'home#home'
  get 'about', to: 'home#about'
  get 'meetings', to: 'home#meetings'
  get 'calendar', to: 'home#calendar'
  get 'resources', to: 'home#resources'
  get 'contact', to: 'home#contact'
  post 'addresses', to: 'home#addresses'

  resources :docs, only: [:show]
end
