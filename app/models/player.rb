class Player < ApplicationRecord
  has_many :transfers
  belongs_to :team, optional: true
  belongs_to :country, optional: true

  validates :name, presence: true
  validates :p_number, numericality: {only_integer: true}, presence: true

  scope :alphabet, ->{order name: :asc}
  scope :owned_by, ->(team_id){where "team_id = ?", team_id}
  scope :load_player_from_ids, ->(ids){where "id IN (?)", ids}

  delegate :name, :logo, to: :team, prefix: true, allow_nil: true
  delegate :name, to: :country, prefix: true, allow_nil: true

  mount_uploader :picture, PictureUploader
end
