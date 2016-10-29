require 'rails_helper'

RSpec.describe 'Login' do
  before(:each) do
    create(:user)
  end
  it 'successfull' do
    visit new_sessions_path
    fill_in 'email', with: 'sasha@pupkin.com'
    fill_in 'password', with: '123456'
    click_button 'Log in'
    expect(page).to have_content 'FlashCards' and 'You successfull authorize!'
  end

  it 'fail' do
    visit new_sessions_path
    fill_in 'email', with: 'sasha@pupkin.com'
    fill_in 'password', with: '123'
    click_button 'Log in'
    expect(page).to have_content 'Login' and 'Your email or password is invalid!'
  end
end
