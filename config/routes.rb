Rails.application.routes.draw do
  post 'check_word', to: 'home#check_word'

  resources :cards, except: :show

  root 'home#index'
end
