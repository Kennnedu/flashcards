require 'rails_helper'

RSpec.describe 'card' do
  before(:each) do
    create(:card)
    login('sasha@pupkin.com', '123456')
  end

  describe 'create' do
    it 'right' do
      visit new_card_path
      fill_in 'card_original_text', with: 'стол'
      fill_in 'card_translated_text', with: 'table'
      attach_file 'card_picture', Rails.root + 'test/fixtures/files/table.JPG'
      select 'English', from: 'card_deck_id'
      click_button 'Create Card'
      expect(page).to have_content 'Card was successfull created!'
      expect(Card.last.picture.present?).to eq true
    end

    it 'worng' do
      visit new_card_path
      fill_in 'card_original_text', with: 'table'
      fill_in 'card_translated_text', with: 'table'
      attach_file 'card_picture', Rails.root + 'test/fixtures/files/table.JPG'
      click_button 'Create Card'
      expect(page).to have_button 'Create Card'
      expect(Card.last.picture.present?). to eq false
    end
  end

  describe 'edit' do
    before(:each) do
      visit cards_path
      click_link 'Edit'
    end
    it 'value of card_original_text in forms' do
      expect(find('#card_original_text')['value']).to eq 'Ärger'
    end
    it 'value of card_translated_text in forms' do
      expect(find('#card_translated_text')['value']).to eq 'annoyance, anger, worry'
    end
    it 'right updated' do
      fill_in 'card_original_text', with: 'стол'
      fill_in 'card_translated_text', with: 'table'
      click_button 'Update Card'
      expect(page).to have_content 'Card was succsessfull updated!'
    end
    it 'wrong updated' do
      fill_in 'card_original_text', with: 'table'
      fill_in 'card_translated_text', with: 'table'
      click_button 'Update Card'
      expect(page).to have_button 'Update Card'
    end
  end

  describe 'delete' do
    it 'right' do
      visit cards_path
      click_button 'Delete'
      expect(page).to have_content 'Card was successfull deleted!'
    end
  end
end
