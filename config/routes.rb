Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  root to: 'welcome#index'

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
end
