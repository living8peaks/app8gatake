class Favorite < ApplicationRecord
  belongs_to :lend_farmland
  belongs_to :user
  validates :user_id, uniqueness: { scope: [:lend_farmland_id] }
end
