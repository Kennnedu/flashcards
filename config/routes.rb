Rails.application.routes.draw do
  resources :decks, only: [:new, :create, :index] 

  get "oauth/callback" => "oauths#callback"

  get "oauth/:provider" => "oauths#oauth", :as => :auth_at_provider

  resource :sessions, only: [:new, :create, :destroy]

  resource :users, except: [:index, :destroy, :show] do
    put 'update_current_deck', to: 'users#update_current_deck'
  end

  post 'check_word', to: 'home#check_word'

  resources :cards, except: :show

  root 'home#index'
end
