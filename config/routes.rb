Rails.application.routes.draw do
  devise_for :users
  get 'post/index'
  root to: 'post#index'
	get '/welcome' => 'pages#welcome'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
