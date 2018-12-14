Rails.application.routes.draw do
  resources :events
  devise_for :admins
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: {
      sessions: 'authentication/sessions'
  }

  scope "(:locale)", locale: /en|vi/ do
    resources :users do
      resources :people
    end
    resources :categories, only: [:index, :show]
    resources :products do
      get "product_male", to: 'products#product_for_male', as: :products_male
      get "product_female", to: 'products#product_for_female', as: :products_female
    end
    resources :carts, except: [:index, :edit]
    resources :line_items
    resources :posts
    #checkout cart
    get 'checkout' => 'checkouts#checkout'
    post 'confirm' => 'checkouts#confirm'

    get 'display' => 'home#post_display'
    post 'add_fav' => 'posts#add_favorite'

    root "home#index"
    get '*path', to: 'home#index'
  end

  # get 'budgets' => 'budgets#download'
  # mount ActionCable.server => '/cablerout'

  # get '/rooms/:id' => 'rooms#show', as: 'room'

end
