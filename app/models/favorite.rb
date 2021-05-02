class Favorite < ApplicationRecord
  belongs_to :lend_farmland
  belongs_to :user
  validates_uniqueness_of :lend_farmland_id, scope: :user_id
end
