Rails.application.routes.draw do

resources :users
#  get 'users/new'


root 'static_pages#home'

#  get 'static_pages/home'
#  get 'static_pages/help'
#  get 'static_pages/about'
#  get 'static_pages/contact'

  match '/help',   to: 'static_pages#help',    via: 'get'
  match '/about',  to: 'static_pages#about',   via: 'get'
  get  '/contact', to: 'static_pages#contact', via: 'get'
# match и get  работают одинаково


  match '/signup', to: 'users#new', via: 'get'




end
