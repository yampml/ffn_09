class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :commentable, polymorphic: true
  scope :newest, ->{order created_at: :desc}
  delegate :name, to: :user, prefix: true, allow_nil: true

  validates :content, presence: true
end
