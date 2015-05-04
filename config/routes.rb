Rails.application.routes.draw do

root 'static_pages#home'

#  get 'static_pages/home'
#  get 'static_pages/help'
#  get 'static_pages/about'
#  get 'static_pages/contact'

  match '/help',   to: 'static_pages#help',    via: 'get'
  match '/about',  to: 'static_pages#about',   via: 'get'
  get  '/contact', to: 'static_pages#contact', via: 'get'
# match и get  работают одинаково

  get 'users/new'
  match '/signup', to: 'users#new', via: 'get'




end
