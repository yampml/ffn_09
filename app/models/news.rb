class News < ApplicationRecord
  has_many :comments, as: :commentable
  belongs_to :user
  scope :newest, ->{order created_at: :desc}
  delegate :name, to: :user, prefix: "author", allow_nil: true

  validates :header, presence: true
  validates :content, presence: true

  mount_uploader :header_img, NewsHeaderImageUploader
end
