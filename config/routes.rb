Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    resources :people
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    resources :line_items
    resources :carts, except: [:index, :edit]
    resources :products
    resources :posts
    resources :users
    resources :categories, only: [:index, :show]

    namespace :manager do
      resources :categories
    end
    get 'display' => 'home#post_display'
    post 'add_fav' => 'posts#add_favorite'
    controller :sessions do
      get 'login' => :index
      post 'login' => :create
      delete 'logout' => :destroy
    end

    root "home#index"
  end
  get 'budgets' => 'budgets#download'
  get '*path', to: 'home#index'
end
