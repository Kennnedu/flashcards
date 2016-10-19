# Model Card
class Card < ApplicationRecord
  validates :original_text, :translated_text, :review_date, presence: true
  validate :equal_text

  before_create :increase_days
  before_validation :strip_text

  private

  def equal_text
    return if original_text.downcase != translated_text.downcase
    errors.add(:original_text, 'can\'t be equal Translated Text')
  end

  def strip_text
    original_text.strip!
    translated_text.strip!
  end

  def increase_days
    self.review_date = review_date.next_day(3)
  end
end
