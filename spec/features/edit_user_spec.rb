require 'rails_helper'

RSpec.describe 'edit user' do
  before(:each) do
    create(:user)
    login('sasha@pupkin.com', '123456')
    visit edit_users_path
  end

  describe 'right' do
    it 'without change' do
      click_button 'Update'
      expect(page).to have_content 'Your profile successful updated!' and 'FlashCards'
    end

    it 'with change password' do
      fill_in 'email', with: 'sasha@ivanov.com'
      fill_in 'password', with: '123'
      fill_in 'password_confirmation', with: '123'
      click_button 'Update'
      expect(page).to have_content 'Your profile successful updated!' and 'FlashCards'
    end
  end

  describe 'wrong' do
    it 'change password' do
      fill_in 'email', with: 'sasha@ivanov.com'
      fill_in 'password', with: '123'
      fill_in 'password_confirmation', with: '123456'
      click_button 'Update'
      expect(page).to have_content 'Edit user'
    end
  end
end
