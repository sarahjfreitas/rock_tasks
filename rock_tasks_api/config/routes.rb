Rails.application.routes.draw do
  resources :members
  get 'roles', to: 'roles#index'
  post 'authenticate', to: 'authentication#authenticate'
end
