Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'
  get 'home/index'
  get 'calling' => 'alerts#calling'
  get 'start_call' => 'alerts#start_call'
  post 'api/auth/signup' => "api/authorizations#signup"
  post 'api/auth/signin' => "api/authorizations#signin"
  post 'api/auth/profile/edit' => "api/authorizations#edit"
  post 'api/duck/create' => 
end
