class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  has_many :notifications, dependent: :destroy
  has_one_attached :remark_image
  validates :remark, presence: true, length: { maximum: 80 }
  default_scope -> { order(created_at: :desc) }
  validates :remark_image, content_type: { in: %w[image/jpeg image/gif image/png], message: '有効な画像形式にしてください' }, size: { less_than: 5.megabytes, message: '5MB未満の画像にしてください' }

  def comment_image
    remark_image.variant(resize_to_fill: [200, 200])
  end
end
