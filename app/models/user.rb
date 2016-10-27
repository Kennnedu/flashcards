# app/model/user.rb
class User < ApplicationRecord
  has_many :cards
end
