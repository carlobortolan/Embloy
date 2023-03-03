Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  #= <<<<< *API* >>>>>>
  namespace :api, defaults: { format: 'json' } do
    namespace :v0 do
      post 'user', to: 'registrations#create'
      get 'user/verify', to: 'registrations#verify'
      post 'user/auth/token/refresh', to: 'authentications#create_refresh'
      post 'user/auth/token/access', to: 'authentications#create_access'
      get 'user/jobs', to: 'user#own_jobs'
      get 'user/applications', to: 'user#own_applications'
      patch 'password', to: 'passwords#update'
      post 'password/reset', to: 'password_resets#create'
      post 'jobs', to: 'jobs#create'
      patch 'jobs', to: 'jobs#update'
      delete 'jobs', to: 'jobs#destroy'
      get 'jobs/(/:id)/applications', to: 'applications#show'
      post 'jobs/(/:id)/applications', to: 'applications#create'
      #delete 'jobs/(/:id)/applications', to: 'applications#destroy'
    end
  end

  #= <<<<< *Web-Application* >>>>>>
  # -----> Homepage <-----
  root 'welcome#index', as: :root
  get 'about', :to => 'welcome#about', as: :about
  get 'about/privacy/policy', :to => 'welcome#privacy_policy', as: :privacy_policy
  get 'about/privacy/cookies', :to => 'welcome#cookies', as: :cookies
  get 'about/help', :to => 'welcome#help', as: :help
  get 'about/api', :to => 'welcome#api', as: :api
  get 'about/api/apidoc.json', :to => 'welcome#apidoc', as: :apidoc
  get 'about/faq', :to => 'welcome#faq', as: :faq

  # -----> Admin <-----
  # authenticated :user, ->(user) { user.admin? } do
  #   get 'admin', to: 'admin#index'
  #   get 'admin/jobs', to: 'admin#jobs'
  #   get 'admin/applications', to: 'admin#applications'
  #   get 'admin/users', to: 'admin#users'
  #   get 'admin/reviews', to: 'admin#reviews'
  # end

  # -----> Jobs & Applications <-----
  resources :jobs do
    resources :applications
  end
  get 'jobs/(/:job_id)/applications/(/:application_id)/accept', :to => 'applications#accept', as: :job_application_accept
  get 'jobs/(/:job_id)/applications/(/:application_id)/reject', :to => 'applications#reject', as: :job_application_reject
  get 'jobs/(/:job_id)/applications_reject_all', :to => 'applications#reject_all', as: :job_applications_reject_all
  delete 'jobs/(/:job_id)/applications/(/:application_id)' => 'applications#destroy'

  get 'reviews', :to => 'reviews#index', as: :reviews
  get 'reviews/(/:user_id)', :to => 'reviews#for_user', as: :reviews_user
  post 'reviews', :to => 'reviews#index'

  # -----> Feed-Generator <-----
  get 'find_jobs', :to => 'jobs#find', as: :jobs_find
  post 'find_jobs', :to => 'jobs#parse_inputs'

  # -----> Authentication & Authorization <-----
  get 'sign_up', to: 'registrations#new'
  post 'sign_up', to: 'registrations#create'
  get 'sign_in', to: 'sessions#new'
  post 'sign_in', to: 'sessions#create', as: :log_in
  delete 'logout', to: 'sessions#destroy'

  get "/auth/github/callback", to: 'oauth_callbacks#github', as: :auth_github_callback
  get "/auth/google_oauth2/callback", to: 'oauth_callbacks#google', as: :auth_google_callback

  get 'password', to: 'passwords#edit', as: :edit_password
  patch 'password', to: 'passwords#update'
  get 'password/reset', to: 'password_resets#new'
  post 'password/reset', to: 'password_resets#create'
  get 'password/reset/edit', to: 'password_resets#edit'
  patch 'password/reset/edit', to: 'password_resets#update'

  # -----> User management <-----
  # get 'user/', :to => 'user#index', as: :user_index
  get 'user/profile', :to => 'user#index', as: :profile_index
  get 'user/settings', :to => 'user#settings', as: :profile_settings
  get 'user/edit', :to => 'user#edit', as: :profile_edit
  get 'user/applications', :to => 'user#own_applications', as: :own_applications
  get 'user/jobs', :to => 'user#own_jobs', as: :own_jobs
  get 'user/preferences', to: 'user#preferences', as: :preferences
end
