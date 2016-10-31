require 'rails_helper'

RSpec.describe 'registration' do
  describe 'sign up' do
    it 'successfull' do
      visit new_users_path
      fill_in 'user_email', with: 'sasha@pupkin.com'
      fill_in 'user_password', with: '123'
      fill_in 'user_password_confirmation', with: '123'
      click_button 'Sign up'
      expect(User.last.email).to eq 'sasha@pupkin.com'
      expect(page).to have_content 'FlashCards'
    end

    it 'fail' do
      visit new_users_path
      fill_in 'user_email', with: 'sasha@pupkin.com'
      fill_in 'user_password', with: '123'
      fill_in 'user_password_confirmation', with: '12345'
      click_button 'Sign up'
      expect(User.last).to eq nil
      expect(page).to have_content 'Registration'
    end
  end
end
