# Home Controller
class HomeController < ApplicationController
  def index
    @card = Card.three_day_ago.first
  end

  def check_word
    @card = Card.find(params[:card][:id])
    if @card.check(params[:card][:checking_word])
      @card.save!
      redirect_to root_path, notice: 'Right!'
    else
      redirect_to root_path, notice: 'Wrong!'
    end
  end
end
