require 'rails_helper'

RSpec.describe 'protected_action' do

  describe 'not_authorize' do
    it 'root_path' do
      visit root_path
      expect(page).to have_content 'You should authorize!'
    end

    it 'card_new' do
      visit new_card_path
      expect(page).to have_content 'You should authorize!'
    end

    it 'new_sessions' do
      visit new_sessions_path
      expect(page).to have_content 'Login'
    end

    it 'new_users' do
      visit new_users_path
      expect(page).to have_content 'Registration'
    end

    it 'edit_user' do
      visit edit_users_path
      expect(page).to have_content 'You should authorize!'
    end
  end

 
  describe('authorize') do
    before(:each) do
      create(:user)
      login('sasha@pupkin.com', '123456')
    end

    it 'root_path' do
      visit root_path
      expect(page).to have_content 'FlashCards'
    end

    it 'card_new' do
      visit new_card_path
      expect(page).to have_button('Create Card')
    end

    it 'new_sessions' do
      visit new_sessions_path
      expect(page).to have_content 'You authorized already!'
    end

    it 'new_users' do
      visit new_users_path
      expect(page).to have_content 'You authorized already!'
    end

    it 'edit_user' do
      visit edit_users_path
      expect(page).to have_content 'Edit user'
    end
  end
end
