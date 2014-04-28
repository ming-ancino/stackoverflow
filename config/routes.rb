QuestionPlatform::Application.routes.draw do

  resources :home
  

  resources :questions do
    resources :answers do
      resources :comments
      resources :votes
    end
    resources :votes
  end

  resources :sessions
  resource :users
    get "login" => "sessions#new", :as => "login"
    get "sign_up" => "users#new", :as => "sign_up"
    get "logout" => "sessions#destroy", :as => "logout"
   root :to => 'sessions#new'
end
