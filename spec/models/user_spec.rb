require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validate password' do
    it 'if size less then 4' do
      user = User.create(email: 'sidorov@mail.ru', password: '12', password_confirmation: '12')
      expect(user.invalid?).to eq true
    end

    it 'if set password_confirmation set nil' do
      user = User.create(email: 'sidorov@mail.ru', password: '12345', password_confirmation: nil)
      expect(user.invalid?).to eq true
    end

    it 'if password_confirmation not equal password' do
      user = User.create(email: 'sidorov@mail.ru', password: '12345', password_confirmation: '123')
      expect(user.invalid?).to eq true
    end

    it 'if all params set correct' do 
      user = User.create(email: 'sidorov@mail.ru', password: '12345', password_confirmation: '12345')
      expect(user.invalid?).to eq false
    end
  end
end
