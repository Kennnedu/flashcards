Rails.application.routes.draw do
  resource :cards, only: :show
  root 'home#index'
end
