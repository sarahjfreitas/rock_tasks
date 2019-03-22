Rails.application.routes.draw do
  resources :members
  post 'authenticate', to: 'authentication#authenticate'
end
