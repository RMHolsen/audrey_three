Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :projects #do 
    #resources :lists, only: [:show, :new, :create, :edit, :update]
  #end 
  #Originally intended to have lists nested under projects but maybe it makes more sense to have items nested under lists
  #Since lists may be useful across more than one project, and eventually there will be a public/private toggle
  
  resources :lists do 
    resources :items 
  end 
  #Either way it definitely makes sense to have items nested under lists. 
  

  resources :topics   
  #Topics to see the join table, largely private to individuals except through public lists, containing project information

  resources :sources 
  #Sources being an independent object of items rather than a subset of items, because an item can have many different sources
  #And sources can have many different items 
  #So if users want to look at all the resources available through a particular source, or vice versa, they can see it. 
  #Independent (sort of?) of the list they're on
  #That second part may require some rejiggering of resources
  #But I think so far it works to just have a source show page iterate over all the items from that source, rather than going through the item object
  

  get '/free_sources', to: 'sources#free', as: "free_sources"
  get '/paywall_sources', to: "sources#paywall", as: "paywall_sources"


  resources :users
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  
 
  root 'static#index'
  get '/public_lists', to: 'static#public_lists', as: "public_lists"

  #Omniauth code
  #get '/auth/:github/callback', to: "sessions#create"
  #Once github authenticates the user this is where we want the user to land, at creating a new session

end
