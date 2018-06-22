class Team < ApplicationRecord
  has_many :players, dependent: :destroy
  has_many :team1_matches, class_name: Match.name, foreign_key: :team1_id
  has_many :team2_matches, class_name: Match.name, foreign_key: :team2_id
  has_many :leagues, through: :leagues_teams

  validates :name, presence: true

  mount_uploader :picture, PictureUploader
  mount_uploader :logo, LogoUploader
end
