class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  validates :remark, presence: true
  default_scope -> { order(created_at: :desc) }
end
