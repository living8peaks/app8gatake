class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post
  belongs_to :lend_farmland
  validates :user_id, uniqueness: { scope: :post_id }
  validates :user_id, uniqueness: { scope: :lend_farmland_id }
end
