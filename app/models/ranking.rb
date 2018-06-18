class Ranking < ApplicationRecord
  belongs_to :league

  validates :number_of_matches, numericality: {only_integer: true}
  validates :win, numericality: {only_integer: true}
  validates :draw, numericality: {only_integer: true}
  validates :lose, numericality: {only_integer: true}
  validates :number_of_goals, numericality: {only_integer: true}
  validates :score, numericality: {only_integer: true}
end
