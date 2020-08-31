Rails.application.routes.draw do
  constraints Clearance::Constraints::SignedIn.new do
    root to: "dashboards#show", as: nil
  end

  root to: "homes#show"
  resources :tweets, only: [:create, :show] do
    member do
      post "like" => "likes#create"
      delete "unlike" => "likes#destroy"
    end
  end
  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, only: [:create]

  resources :users, only: [:create, :show] do
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]
end

# get "/sign_in" => "sessions#new", as: "sign_in"
# delete "/sign_out" => "sessions#destroy", as: "sign_out"
# get "/sign_up" => "users#new", as: "sign_up"
end
