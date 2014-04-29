QuestionPlatform::Application.routes.draw do

  root :to => 'sessions#new'  
  get 'login' => 'sessions#new'
  get 'sign_up' => 'users#new'
  get 'logout' => 'sessions#destroy'

  resources :questions do
    resources :answers do
      resources :comments
      resources :votes
    end
    resources :votes
  end

  resources :sessions
  resources :users

end
