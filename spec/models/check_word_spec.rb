require 'rails_helper'

RSpec.describe CheckWord do
  context 'method call' do
    it 'get success and "Right!" if right original_text' do
      card = create(:card)
      interactor_right = CheckWord.call(
        id: card.id,
        original_text: 'Ärger'
      )
      expect(interactor_right.success?).to eq true 
      expect(interactor_right.message).to eq 'Right!'
    end

    it 'get fail and "Wrong!" if worng original_text' do
      card = create(:card)
      interactor_wrong = CheckWord.call(
        id: card.id,
        original_text: 'asd'
      )
      expect(interactor_wrong.success?).to eq false
      expect(interactor_wrong.message).to eq 'Wrong!'
    end
  end
end
