require 'rails_helper'

RSpec.describe Card, type: :model do 
  before (:each) do
    @user = create(:user)
  end

  context 'method equal_text' do
    it 'get errors if equal original and translated text' do
      card = @user.cards.create(original_text: 'asd', translated_text: 'asd')
      expect(card.errors.empty?).to eq false
    end

    it 'get errors if differ register translated_text' do
      card = @user.cards.create(original_text: 'asd', translated_text: 'ASD')
      expect(card.errors.empty?).to eq false
    end
  end

  context 'method set_review_date' do
    it 'get date of today after three day' do
      card = @user.cards.create(original_text: 'asd', translated_text: 'qASD')
      expect(card.review_date).to eq Date.today.next_day(3)
    end
  end

  context 'method stripe_text' do
    it 'get string without space if original_text have space' do
      card = @user.cards.create(original_text: '   qwe  ', translated_text: 'zxc')
      expect(card.original_text).to eq 'qwe'
    end

    it 'get string without space if translated_text have space' do 
      card = @user.cards.create(original_text: 'qweqwe', translated_text: '  zxc  ' )
      expect(card.translated_text).to eq 'zxc'
    end
  end

  context 'with user' do
    it 'get true if card created in db with user' do
      card = Card.create(original_text: 'qweqwe', translated_text: 'zxc', user_id: User.first.id)
      expect(Card.last.present?).to eq true 
    end

    it 'get false if card not created with user ' do
      card = Card.create(original_text: 'qweqwe', translated_text: 'zxc', user_id: nil)
      expect(Card.last.present?).to eq false 
    end
  end
end
