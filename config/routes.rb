Felldown::Application.routes.draw do
  resources :followers, only: [:edit, :new, :create, :update, :destroy]

  resources :events do
    collection do 
      get "minorfall" 
      get "majorfall"
      get "panic"
      get "medications"
      get "refresh"
      get "weight"
    end
  end


  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => 'events#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
