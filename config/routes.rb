Rails.application.routes.draw do

resources :users
resources :sessions, only: [:new, :create, :destroy]

root 'static_pages#home'
#  get 'users/new'
#  get 'static_pages/home'
#  get 'static_pages/help'
#  get 'static_pages/about'
#  get 'static_pages/contact'

  match '/help',   to: 'static_pages#help',    via: 'get'
  match '/about',  to: 'static_pages#about',   via: 'get'
  get  '/contact', to: 'static_pages#contact', via: 'get'
# match и get  работают одинаково


  match '/signup',  to: 'users#new', 	    via: 'get'
  match '/signin',  to: 'sessions#new',     via: 'get'
  match '/signout', to: 'sessions#destroy', via: 'delete'




end
