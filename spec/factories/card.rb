FactoryGirl.define do
  factory :card do
    original_text 'Ärger'
    translated_text 'annoyance, anger, worry'
    review_date Date.today
  end
end
