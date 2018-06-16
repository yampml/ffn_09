class News < ApplicationRecord
  has_many :comments, as: :commentable

  validates :header, presence: true
  validates :content, presence: true
end
