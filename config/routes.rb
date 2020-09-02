Rails.application.routes.draw do
  constraints Clearance::Constraints::SignedIn.new do
    root 'dashboards#show', as: :authenticated_root
  end
  root "homes#show"

  resource :search, only: [:show]

  post 'text_tweets', to: 'tweets#create', defaults: { content_type: TextTweet }
  post 'photo_tweets', to: 'tweets#create', defaults: { content_type: PhotoTweet }

  resources :tweets, only: [:show] do
    member do
      post 'like', to: 'likes#create'
      delete 'unlike', to: 'likes#destroy'
    end
  end

  resources :hashtags, only: [:show]

  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, only: [:create]

  resources :users, only: [:create, :show] do
    resources :followers, only: :index
    member do
      post 'follow', to: 'followed_users#create'
      delete 'unfollow', to: 'followed_users#destroy'
    end
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]
  end

  get "/sign_in" => "sessions#new", as: "sign_in"
  delete "/sign_out" => "sessions#destroy", as: "sign_out"
  get "/sign_up" => "users#new", as: "sign_up"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
