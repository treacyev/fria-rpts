Rails.application.routes.draw do
  devise_for :users
  resources :proposals
  resources :reviews
  resources :votes
  root :to => 'landing_page#index'

  post '/proposal/cancel' => 'proposals#cancel', as: 'cancel_proposal'
  get '/myproposals' => 'landing_page#researcher_proposals', as: 'myproposals' #DELETE LATER
  get '/viewproposal' => 'landing_page#researcher_view', as: 'viewproposal' #DELETE LATER
  get '/home' => 'landing_page#member_home', as: 'memberhome' #DELETE LATER
  get '/memproposals' => 'landing_page#member_proposals', as: 'memberproposals' #DELETE LATER
  get '/archive' => 'landing_page#member_archive', as: 'memberarchive' #DELETE LATER

  get '/headproposals' => 'landing_page#head_proposals', as: 'headproposals' #delete later
   get '/headhome' => 'landing_page#head_home', as: 'headhome' #delete later
  resources :announcements
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end