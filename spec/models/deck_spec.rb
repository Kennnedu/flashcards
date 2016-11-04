require 'rails_helper'

RSpec.describe Deck, type: :model do
  context 'with user' do
    it 'present' do 
      create(:user)
      Deck.create(name: 'English', user_id: User.last.id)
      expect(Deck.last.name).to eq 'English'
    end

    it 'absent' do
      deck = Deck.create(name: 'English')
      expect(deck.errors.present?).to eq true
    end
  end

  context 'with name' do
    before(:each) do
      create(:user)
    end

    it 'absent' do
      deck = Deck.create(user_id: User.last.id)
      expect(deck.errors.present?).to eq true
    end
  end
end
