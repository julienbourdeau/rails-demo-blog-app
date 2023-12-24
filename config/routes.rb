Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  get 'post-list' => "demo#post_list", as: 'post_list'
  get 'random' => "demo#random_post", as: 'random_post'
  get 'post/:id' => "demo#post", as: 'post'
  get 'jobs' => "demo#jobs", as: 'jobs'

  constraints format: :json do
    scope path: :api do
      get "jobs" => "api#jobs"
      get "add_reaction" => "api#add_reaction"
    end
  end

  if defined? Debugbar
    mount Debugbar::Engine => Debugbar.config.prefix
  end
end
