Rails.application.routes.draw do
  root   'pages#home'
  get    '/home', to: 'pages#home'

  #get    '/recipes',          to: 'recipes#index'
  #post   '/recipes',          to: 'recipes#create'
  #get    '/recipes/new',      to: 'recipes#new',    as: 'new_recipe'
  #get    '/recipes/:id/edit', to: 'recipes#edit',   as: 'edit_recipe'
  #get    '/recipes/:id',      to: 'recipes#show',   as: 'recipe'
  #patch  '/recipes/:id',      to: 'recipes#update'
  #put    '/recipes/:id',      to: 'recipes#update'
  #delete '/recipes/:id',      to: 'recipes#destroy'

  resources :recipes

end
