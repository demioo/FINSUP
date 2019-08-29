Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [] do
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
    collection do
      get 'dashboard_advisor'
      get 'unanswered'
      post 'specialty'
      get 'content'
      post 'set_content'
      get 'completed', to: 'requests#create'
    end
  end
end
