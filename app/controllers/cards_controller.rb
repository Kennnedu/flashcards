# app/controllers/cards_controller.rb
class CardsController < ApplicationController
  before_action :require_login
  before_action :set_card, only: [:edit, :destroy, :update]

  def index
    @cards = current_user.cards
  end

  def new
    @card = Card.new
  end

  def edit
  end

  def create
    if current_user.cards.create(params_card)
      redirect_to cards_path, notice: 'Card was successfull created!'
    else
      render :new
    end
  end

  def update
    if @card.update(params_card)
      redirect_to cards_path, notice: 'Card was succsessfull updated!'
    else
      render :edit
    end
  end

  def destroy
    @card.destroy
    redirect_to cards_path, notice: 'Card was successfull deleted!'
  end

  private

  def params_card
    params.require(:card).permit(:original_text, :translated_text)
  end

  def set_card
    @card = Card.find(params.permit(:id)[:id])
  end
end
