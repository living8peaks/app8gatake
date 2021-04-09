class RentFarmland < ApplicationRecord
  include EnumForDistrictSelection

  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :rent_philosophy, length: { maximum: 1000 }
  validates :rent_other_term, length: { maximum: 500 }
  enum rent_municipality: { 茅野市: 0, 諏訪郡原村: 1, 諏訪郡富士見町: 2 }, _prefix: true
  enum rent_area: { 五畝未満: 0, 五畝〜一反: 1, 一反〜一反五畝: 2, 一反五畝〜二反: 3, 二反〜二反五畝: 4, 二反五畝以上: 5 }, _prefix: true
  enum rent_field_type: { 田: 0, 畑: 1, その他: 2 }, _prefix: true
  enum borrow_immediately: { すぐに借りたい: 0, すぐではなくて良いけど借りたい: 1 }
  enum rent_desired_year: { 一年未満: 0, 一年〜二年: 1, 二年〜三年: 2, 三年以上: 3, 現時点では未定: 4 }, _prefix: true
  enum rending_term: { 無償を希望: 0, 条件付き無償を希望: 1, 有償で構わない: 2 }
  validates :rent_municipality,
            inclusion: { in: Rentfarmland.rent_municipalities.keys }
  validates :rent_area,
            inclusion: { in: RentFarmland.rent_areas.keys }
  validates :rent_field_type,
            inclusion: { in: RentFarmland.rent_field_types.keys }
  validates :borrow_immediately,
            inclusion: { in: RentFarmland.borrow_immediatelies.keys }
  validates :rent_desired_year,
            inclusion: { in: RentFarmland.rent_desired_years.keys }
  validates :renting_term,
            inclusion: { in: RentFarmland.renting_terms.keys }
end
