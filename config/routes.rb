Rails.application.routes.draw do
  root to: "main#index"

  # sessions and creating accounts
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  get '/signup' => 'users#new'

  resources :users

  # admin section
  namespace :admin, path: 'digsy_admin' do
    get '/login' => 'sessions#login'
    post '/login' => 'sessions#create'
    get '/logout' => 'sessions#destroy'

    get '/index' => 'main#index'

    # can create them in admin
    resources :agent_actions
  end
end
