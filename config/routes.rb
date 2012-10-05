ChargifyTodoList::Application.routes.draw do
  
  match 'signin' => 'user_sessions#new', :as => :signin
  match 'signout' => 'user_sessions#destroy', :as => :signout
  resources :user_sessions
  resource :account, :controller => "users"
  resources :users
  
  root :to => "user_sessions#new"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
