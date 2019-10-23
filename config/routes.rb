Rails.application.routes.draw do
  get 'home/index'

  get 'styles/atoms'

  get 'styles/molecules'

  get 'styles/organisms'

  get 'ideas/index'

  root to: 'home#index'

  get 'ideas/new'

  post 'ideas/create'

  get 'acount/ideas'

  get 'ideas/:id/edit', to: 'ideas#edit', as: 'edit_ideas'

  patch 'ideas/:id', to: 'ideas#update', as: 'ideas'

  get 'ideas/:id', to: 'ideas#show', as: 'show_ideas'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
