Rails.application.routes.draw do
  resources :pages, only: [:create]
  get '/page', to: 'pages#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
