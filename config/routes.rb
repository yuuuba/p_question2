Rails.application.routes.draw do
  devise_for :users
  
  root to: 'posts#index'
  resources :posts
  resources :posts do
    resources :questions, only: [:index, :new, :create, :destroy]
  end
  
  resources :posts do
    resources :questions do
      resources :answers, only: [:new, :create, :destroy]
    end
  end

end
