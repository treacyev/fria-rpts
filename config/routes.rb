Rails.application.routes.draw do
  devise_for :users
  resources :proposals
  resources :reviews
  resources :votes
  root :to => 'landing_page#index'

  get '/myproposals' => 'landing_page#researcher_proposals', as: 'myproposals' #DELETE LATER
  get '/viewproposal' => 'landing_page#researcher_view', as: 'viewproposal' #DELETE LATER
  get '/home' => 'landing_page#member_home', as: 'memberhome' #DELETE LATER
  get '/memproposals' => 'landing_page#member_proposals', as: 'memberproposals' #DELETE LATER
  get '/archive' => 'landing_page#member_archive', as: 'memberarchive' #DELETE LATER
  resources :announcements
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end