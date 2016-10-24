# app/interactors/check_word.rb
class CheckWord
  include Interactor

  def call
    card = Card.find(context.id)
    if card.original_text.eql? context.original_text
      card.save
      context.message = 'Right!'
    else
      context.message = 'Wrong!'
      context.fail!
    end
  end
end
