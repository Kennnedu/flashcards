# app/interactors/empty_deck.rb
class EmptyDeck
  include Interactor

  def call
    context.card = current_deck_or_thre_day_ago(context.user)
    context.decks = context.user.decks
  end

  private

  def current_deck_or_thre_day_ago(user)
    return user.cards.three_day_ago.order("RANDOM()").first if user.current_deck.zero?
    user.cards.current_deck(user.deck).three_day_ago.order("RANDOM()").first
  end
end
