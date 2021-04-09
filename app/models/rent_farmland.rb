class RentFarmland < ApplicationRecord
  include EnumForDistrictSelection

  belongs_to :user
  default_scope -> { order(created_at: :desc) }
end
