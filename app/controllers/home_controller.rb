# app/controllers/home_controller.rb
class HomeController < ApplicationController
  before_action :require_login

  def index
    result = EmptyDeck.call(user: current_user)
    @card = result.card
    @decks = result.decks
  end

  def check_word
    result = CheckWord.call(
      id: params[:id],
      original_text: params[:original_text]
    )
    redirect_to root_path, notice: result.message
  end
end
