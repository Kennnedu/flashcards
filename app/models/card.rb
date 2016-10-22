# Model Card
class Card < ApplicationRecord
  attr_accessor :checking_word

  validates :original_text, :translated_text, :review_date, presence: true
  validate :equal_text

  before_validation :set_review_date
  before_validation :strip_text

  scope :three_day_ago, -> { where('review_date <= ?', Date.today) }

  def check(word)
    false unless original_text.eql? word
    set_review_date
    true
  end

  private

  def equal_text
    return if original_text.downcase != translated_text.downcase
    errors.add(:original_text, 'can\'t be equal Translated Text')
  end

  def strip_text
    original_text.strip!
    translated_text.strip!
  end

  def set_review_date
    self.review_date = Date.today.next_day(3)
  end
end
