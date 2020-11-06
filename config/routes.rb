Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do 
      resources :foods
      resources :treats
      resources :walks
      resources :medications
      resources :general_healths

    end
  end
  post 'auth/login', to: 'authentication#authenticate'
end
