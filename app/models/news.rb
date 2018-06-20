class News < ApplicationRecord
  has_many :comments, as: :commentable
  belongs_to :user

  validates :header, presence: true
  validates :content, presence: true
end
