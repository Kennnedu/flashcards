Rails.application.routes.draw do
  resources :cards, except: :show
  root 'home#index'
end
