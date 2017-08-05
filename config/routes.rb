Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      get '/available_jobs', to: 'jobs#show'
      resources :jobs, only: [:index]
    end
  end
end
