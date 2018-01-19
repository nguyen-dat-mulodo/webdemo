Rails.application.routes.draw do
  namespace :admin do
    get 'users/index'
  end
  root to: 'posts#index'
  devise_for :users
  resources :posts
	get '/welcome' => 'pages#welcome'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # get "users/sign_out",to: "sessions#destroy"

  namespace :admin do
    root :to => "base#index"
    resources :users
  end

  resources :categories do
    resources :products
  end
end
