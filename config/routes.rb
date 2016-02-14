Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'welcome#index'

  # resources :welcome, only: [:index]

  # Admin Namespace
  namespace :admin do

  end

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
end
