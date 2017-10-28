class Duck < ApplicationRecord
  has_many :user_ducks
  has_many :users, through: :user_ducks
end
