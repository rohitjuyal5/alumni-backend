Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :users
      post '/users/login',to: 'sessions#login'
      post '/post/show',to: 'posts#display',via: :options
      get '/user/alum',to: 'users#alum'
      get '/user/stu',to: 'users#student'
      get '/user/session',to: 'posts#session_id'
      # post '/user/login',to: 'session#login'
      resources :posts
      resources :session
    end
  end
end
