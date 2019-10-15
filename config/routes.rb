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

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
