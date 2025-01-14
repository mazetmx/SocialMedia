Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")

  authenticated :user do
    root to: "users#index", as: :authenticated_user
    get "users/" => "users#show", as: :show_user
    get "follow", to: "followings#create", as: :follow_user
    delete "unfollow", to: "followings#destroy", as: :unfollow_user
    resources :users do
      resources :posts
    end
  end

  root "home#index"
end
