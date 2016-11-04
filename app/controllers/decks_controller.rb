# app/controllers/decks_controller.rb
class DecksController < ApplicationController
  def new
    @deck = Deck.new
  end

  def create
    @deck = current_user.decks.new(params_deck)
    if @deck.save
      redirect_to root_path, notice: 'The Deck successfull created!'
    else
      redirect_to new_deck_path, notice: @deck.errors.full_messages.join(' ')
    end
  end

  private

  def params_deck
    params.require(:deck).permit(:name)
  end
end
