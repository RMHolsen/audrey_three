Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # resources :authors, only: [:show] do
  # #OLD AND BUSTED
  # #get 'authors/:id/posts', to: "authors#posts_index"
  # #Must put the posts_index method in the controller
  # #get 'authors/:id/posts/:post_id', to: "authors#post"
  #   resources :posts, only: [:show, :index]
  # end 

  resources :projects #do 
    #resources :lists, only: [:show, :new, :create, :edit, :update]
  #end 
  #Originally intended to have lists nested under projects but maybe it makes more sense to have items nested under lists
  #Since lists may be useful across more than one project?
  #Either way it definitely makes sense to have items nested under lists. 

  resources :lists do 
    resources :items 
  end 
  resources :sources 
  resources :users

  #get '/signup', to: 'users#new'
  #post '/signup', to: 'users#create'
  #get '/login', to: 'sessions#new'
  #post '/login', to: 'sessions#create'
  #get '/logout', to: 'sessions#destroy'
  
  root 'static#index'

end
