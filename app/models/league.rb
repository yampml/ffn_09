class League < ApplicationRecord
  has_many :league_team_join_models
  has_many :teams, through: :league_team_join_models
  has_many :matches
  has_one :ranking

  validates :name, presence: true

  scope :alphabet, ->{order name: :asc}

  mount_uploader :logo, LogoUploader
end
