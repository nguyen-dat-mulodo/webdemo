Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :line_items
  resources :carts
  resources :products
  resources :posts
  resources :users
  get 'home/index'

  get 'admin' => 'admin#index'

  controller :sessions do
    get 'login' => :index
    post 'login' => :create
    delete 'logout' => :destroy
  end

  root "home#index"

end
