require 'rails_helper'

RSpec.describe 'check the word' do
  describe 'check the word' do
    before(:each) do 
      create(:card)
    end
    it 'check word if right answer' do
      visit root_path
      fill_in 'original_text', with: 'Ärger'
      click_button 'Check word'
      expect(page).to have_content('Right!')
    end

    it 'check word if wrong answer' do
      visit root_path
      fill_in 'original_text', with: 'asd'
      click_button 'Check word'
      expect(page).to have_content('Wrong!')
    end
  end
end
