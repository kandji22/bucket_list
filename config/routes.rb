Rails.application.routes.draw do
  get 'users/new'

  get 'users/create'

  get 'home/index'

  get 'styles/atoms'

  get 'styles/molecules'

  get 'styles/organisms'

  root to: 'home#index'

  get 'acount/ideas'
  resources :users
  resources :ideas do
    resources :comments
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
