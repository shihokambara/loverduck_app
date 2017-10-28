Rails.application.routes.draw do
#  devise_for :users
  mount_devise_token_auth_for 'User', at: 'api/auth'
  root to: 'home#index'
  get 'home/index'
  get 'calling' => 'alerts#calling'
  get 'start_call' => 'alerts#start_call'
  post 'api/auth/profile' => "api/users#profile"
#  post 'api/auth/signup' => "api/authorizations#signup"
#  post 'api/auth/signin' => "api/authorizations#signin"
#  post 'api/auth/profile/edit' => "api/authorizations#edit"
#  post 'api/duck/create' => "api/ducks#create"
  post 'api/duck/register' => 'api/ducks#register'
  post 'api/duck/list' => 'api/ducks#list'
#  post 'api/duck/detail' => 'api/ducks#show'
#  post 'api/duck/dailylog' => 'api/ducks#dailylog'
#  post 'api/duck/alertlog' => 'api/ducks#alertlog'
#  post 'api/duck/alertlog/update' => 'api/ducks#update_alertlog'
#  post 'api/duck/reactionlog' => 'api/ducks#reaction_log'
end
