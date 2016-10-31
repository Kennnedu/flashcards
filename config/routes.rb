Rails.application.routes.draw do
  get "oauth/callback" => "oauths#callback" # for use with Github, Facebook
  
  get "oauth/:provider" => "oauths#oauth", :as => :auth_at_provider

  resource :sessions, only: [:new, :create, :destroy]

  resource :users, except: [:index, :destroy, :show]

  post 'check_word', to: 'home#check_word'

  resources :cards, except: :show

  root 'home#index'
end
