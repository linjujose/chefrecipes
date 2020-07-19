Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "pages#home"
  get 'pages/home', to: 'pages#home'

  get '/recipes', to: 'recipes#index'

  #since id is dynamic, new could be confused as an id. So, hierarchicaclly put it before show controller
  get '/recipes/new', to: 'recipes#new', as: 'new_recipe'
  
  get '/recipes/:id', to: 'recipes#show', as: 'recipe'

end
