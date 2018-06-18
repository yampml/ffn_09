class Continent < ApplicationRecord
  has_many :countries

  validates :name, length: {maximum: Settings.varchar_maxlen}, presence: true
end
