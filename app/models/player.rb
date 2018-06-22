class Player < ApplicationRecord
  has_many :transfers
  belongs_to :team
  belongs_to :country

  validates :name, presence: true
  validates :p_number, numericality: {only_integer: true}, presence: true

  scope :alphabet, ->{order name: :asc}

  delegate :name, :logo, to: :team, prefix: true, allow_nil: true
  delegate :name, to: :country, prefix: true, allow_nil: true

  mount_uploader :picture, PictureUploader
end
