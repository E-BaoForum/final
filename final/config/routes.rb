Rails.application.routes.draw do
  root "forums#index"

  get '/forums' => 'forums#index'
  get '/forums/new' => 'forums#new'
  post '/forums' => 'forums#create'

  get '/forums/:id' => 'forums#show', :as => 'forum'

  get '/forums/:id/edit' => 'forums#edit', :as => 'forum_edit'
  patch '/forums/:id' => 'forums#update'

  delete '/forums/:id' => 'forums#destroy'

  ##### Sign Up and Sign In and Sign Out
  get '/signup' => 'users#new'
  post '/users' => 'users#create'
  post '/sessions' => 'sessions#create'

  ##### Page for a new session (login)
  get '/signin' => 'sessions#new' 
  ##### Create a new session
  post '/sessions' => 'sessions#create'
  ##### Delete a session (signout)
  get '/signout' => 'sessions#destroy'

  ##### Show and edit the user
  get '/users/:id' => 'users#show', :as => 'user'
  get '/users/:id/edit' => 'users#edit', :as => 'user_edit'
  patch '/users/:id' => 'users#update'
end
