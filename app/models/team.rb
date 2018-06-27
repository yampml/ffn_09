class Team < ApplicationRecord
  has_many :players, dependent: :destroy
  has_many :team1_matches, class_name: Match.name, foreign_key: :team1_id
  has_many :team2_matches, class_name: Match.name, foreign_key: :team2_id
  has_many :league_team_join_model
  has_many :leagues, through: :league_team_join_model

  validates :name, presence: true

  scope :alphabet, ->{order name: :asc}
  scope :load_team_from_ids, ->(ids){where "id IN (?)", ids}
  scope :search_by_name, ->(name){where "name LIKE CONCAT('%',?,'%')", name}
  mount_uploader :picture, PictureUploader
  mount_uploader :logo, LogoUploader
end
