class Bet < ApplicationRecord
  VALID_COIN_REGEX = /\A\d{1,8}(\.\d{0,2})?\z/

  belongs_to :user
  belongs_to :match

  validates :coin, format: {with: VALID_COIN_REGEX},
    numericality: true
end
