Rails.application.routes.draw do
  root 'login#index'
  post 'login', to: 'login#login'
  get 'logout', to: 'login#logout'
  resources :tasks do
  	put 'complete'
  end

  get '/shared', to: 'sharing#shared'

  get 'users/:user_id/tasks', to: 'sharing#index'
  post 'share', to: 'sharing#share'
end
