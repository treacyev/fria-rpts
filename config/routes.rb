Rails.application.routes.draw do
  devise_for :users
  resources :proposals
  resources :reviews
  resources :votes
  root :to => 'landing_page#index'
  resources :announcements
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
