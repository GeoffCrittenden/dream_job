Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/', to: redirect('/api/v1/available_jobs')
  get '/status', to: redirect('/api/v1/status')

  namespace :api do
    namespace :v1 do
      get '/status', to: 'api#status'
      get '/available_jobs', to: 'jobs#show'
      resources :jobs, only: [:index]
    end
  end
end
