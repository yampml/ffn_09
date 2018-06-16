class Player < ApplicationRecord
  has_many :transfers
  belongs_to :team
  belongs_to :country

  validates :name, presence: true
  validates :p_number, numericality: {only_integer: true}, presence: true
end
