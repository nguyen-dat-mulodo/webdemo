Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :branches
  resources :recipes
  resources :events
  devise_for :admins
  devise_for :users, controllers: {
      sessions: 'authentication/sessions'
  }

  scope "(:locale)", locale: /en|vi/ do
    concern :paginatable do
      get '(page/:page)', action: :index, on: :collection, as: ''
    end
    resources :users do
      resources :people
    end
    resources :categories, only: [:index, :show]
    namespace :api do
      resources :products, only: [:index, :show, :create, :destroy, :update]
    end

    resources :products, concerns: :paginatable do
      collection do
        get "/gender/:status", to: 'products#product_for_gender', as: :gender, constraints: { id: /[A-Z]/ }
      end
    end
    resources :carts, except: [:index, :edit]
    resources :line_items
    resources :posts
    #checkout cart
    get 'checkout' => 'checkouts#checkout'
    post 'confirm' => 'checkouts#confirm'

    get 'display' => 'home#post_display'
    post 'add_fav' => 'posts#add_favorite'
    get 'blog', to: 'blog#index', as: :blog
    get 'contact', to: 'contact#index', as: :contact

    root "home#index"
    get '*path', to: 'home#index'
  end

  # get 'budgets' => 'budgets#download'
  # mount ActionCable.server => '/cablerout'

  # get '/rooms/:id' => 'rooms#show', as: 'room'

end
