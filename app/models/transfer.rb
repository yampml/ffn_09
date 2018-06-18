class Transfer < ApplicationRecord
  belongs_to :player

  validates :transfer_day, presence: true
  validates :from_team_id, numericality: {only_integer: true}, presence: true
  validates :to_team_id, numericality: {only_integer: true}, presence: true
end
