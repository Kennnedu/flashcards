# app/controllers/home_controller.rb
class HomeController < ApplicationController
  def index
    @card = Card.three_day_ago.order("RANDOM()").first
  end

  def check_word
    result = CheckWord.call(
      id: params[:id],
      original_text: params[:original_text]
    )
    redirect_to root_path, notice: result.message
  end
end
