# app/controllers/cards_controller.rb
class CardsController < ApplicationController
  before_action :require_login
  before_action :set_card, only: [:edit, :destroy, :update]

  def index
    @cards = current_user.cards
  end

  def new
    @card = Card.new
    @decks = current_user.decks
  end

  def edit
    @decks = current_user.decks
  end

  def create
    @card = current_user.cards.new(params_card)
    if @card.save
      redirect_to cards_path, notice: 'Card was successfull created!'
    else
      redirect_to new_card_path, notice: @card.errors.full_messages.join(' ')
    end
  end

  def update
    if @card.update(params_card)
      redirect_to cards_path, notice: 'Card was succsessfull updated!'
    else
      redirect_to edit_card_path
    end
  end

  def destroy
    @card.destroy
    redirect_to cards_path, notice: 'Card was successfull deleted!'
  end

  private

  def params_card
    params.require(:card).permit(:original_text, :translated_text, :picture, :deck_id)
  end

  def set_card
    @card = Card.find(params.permit(:id)[:id])
  end
end
