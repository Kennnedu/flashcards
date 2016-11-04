FactoryGirl.define do
  factory :card do
    deck
    original_text 'Ärger'
    translated_text 'annoyance, anger, worry'
    review_date Date.today.prev_day(3)
  end
end
