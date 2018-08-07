Rails.application.routes.draw do
  resources :line_items
  resources :carts
  resources :products
  resources :posts
  get 'home/index'

  get 'admin' => 'admin#index'

  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end

  root "home#index"
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
