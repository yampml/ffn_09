class Country < ApplicationRecord
  has_many :leagues
  has_many :teams
  has_many :players
  belongs_to :continent

  validates :name, length: {maximum: Settings.varchar_maxlen}, presence: true
end
