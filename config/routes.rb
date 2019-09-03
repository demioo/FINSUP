Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:edit, :update] do
    resources :reviews, only: [:create]

    collection do
      get 'advisors'
    end
    member do
      get 'show_advisor'
    end
  end
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :requests, only: [:new, :index, :create] do
    resources :responses, only: [:create]
    collection do
      get 'dashboard_advisor'
      get 'unanswered'
      post 'specialty'
      get 'content'
      post 'set_content'
      get 'completed', to: 'requests#create'
    end
    member do
      get 'chat'
    end
  end
end
