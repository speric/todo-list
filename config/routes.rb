ChargifyTodoList::Application.routes.draw do
  resources :user_sessions
  resources :users
  resources :items do
    member do
      post 'mark_as_complete'
    end
  end
  match 'save_sort_order' => 'items#save_sort_order', :as => :save_sort_order, :via => :post
  match 'signin' => 'user_sessions#new', :as => :signin
  match 'signout' => 'user_sessions#destroy', :as => :signout
  
  root :to => "user_sessions#new"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
