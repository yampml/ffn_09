class Achievement < ApplicationRecord
  belongs_to :team, optional: true

  validates :name, presence: true
  validates :received_day, presence: true

  scope :latest, ->{order received_day: :desc}

  delegate :name, to: :team, prefix: true, allow_nil: true

  mount_uploader :picture, LogoUploader
end
