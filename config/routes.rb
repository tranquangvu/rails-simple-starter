Rails.application.routes.draw do
  get '/404', to: 'errors#not_found'
  get '/422', to: 'errors#unprocessable_entity'
  get '/500', to: 'errors#internal_server_error'

  devise_for :users

  namespace :admin do
    root 'dashboard#index'
  end

  root 'pages#home'
end
