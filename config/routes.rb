Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'
  get 'home/index'
  get 'calling' => 'alerts#calling'
  get 'start_call' => 'alerts#start_call'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
