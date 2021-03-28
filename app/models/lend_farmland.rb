class LendFarmland < ApplicationRecord
  belongs_to :user
  validates :lend_philosophy, length: { maximum: 1000 }
  validates :lend_place, presence: true, length: { maximum: 100 }
  validates :lend_other_terms, length: { maximum: 500 }
  
end
