Quizy::Application.routes.draw do

  devise_for :users
  
  devise_scope :user do
    authenticated :user do
      root :to => 'challenges#index', as: :authenticated_root
    end
    unauthenticated :user do
      root :to => 'devise/registrations#new', as: :unauthenticated_root
    end
  end

  resources :challenges
  resources :questions

  get '/profile' => 'users#show'

end
