# app/models/deck.rb
class Deck < ApplicationRecord
  belongs_to :user
  has_many :cards, dependent: :destroy

  validates :name, :user_id, presence: true
end
