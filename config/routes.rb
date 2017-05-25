Rails.application.routes.draw do
  devise_for :users
  resources :proposals
  resources :reviews
  resources :votes

  root :to => 'landing_page#index'

  post '/proposal/cancel' => 'proposals#cancel', as: 'cancel_proposal'
  get '/submission_period/toggle' => 'submission_periods#toggle', as: 'toggle_submission_period'
  get '/proposal/vote' => 'proposals#head_vote', as: 'head_vote'
  get '/proposal/veto' => 'proposals#veto', as: 'veto'
  get '/users/:id' => 'users#show', as: 'show_user'
  get '/users/:id/activate' => 'users#activate', as: 'activate_user'
  get '/users/:id/delete' => 'users#destroy', as: 'destroy_user'
  get '/proposal/search' => 'proposals#search', as: 'search_proposal'
  resources :announcements, except: [:index]
end