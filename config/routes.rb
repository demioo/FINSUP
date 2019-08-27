Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'continue_request/:id', to: "requests#continue_request", as: :continue_request
  post 'last_step', to: "requests#last_step", as: :last_step
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :requests
end
