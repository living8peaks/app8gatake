class LendFarmland < ApplicationRecord
  belongs_to :user
  validates :lend_philosophy, length: { maximum: 1000 }
  validates :lend_place, presence: true, length: { maximum: 100 }
  validates :lend_other_terms, length: { maximum: 500 }
  enum lend_municipality: { 茅野市: 0, 諏訪郡原村: 1, 諏訪郡富士見町: 2 }
end
