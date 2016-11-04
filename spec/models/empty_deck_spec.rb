require 'rails_helper'

RSpec.describe EmptyDeck do
  context 'method call' do
    before(:each) do
      create(:card)
    end
    it 'if current_deck is number' do
      User.last.update(current_deck: Deck.last.id)
      result = EmptyDeck.call(user: User.last)
      expect(result.card.deck.name).to eq 'English' 
    end
  end
end
