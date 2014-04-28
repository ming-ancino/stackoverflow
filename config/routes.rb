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
    get 'login' => 'sessions#new'
    get 'sign_up' => 'users#new'
    get 'logout' => 'sessions#destroy'
   root :to => 'sessions#new'
end
