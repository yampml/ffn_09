class News < ApplicationRecord
  has_many :comments, as: :commentable
  belongs_to :user
  scope :newest, ->{order created_at: :desc}

  validates :header, presence: true
  validates :content, presence: true
end
