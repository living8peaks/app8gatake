class LendFarmland < ApplicationRecord
  include EnumForDistrictSelection

  belongs_to :user
  has_one_attached :farm_image
  has_many :likes, -> { order(created_at: :desc) }, dependent: :destroy
  default_scope -> { order(created_at: :desc) }
  geocoded_by :address
  after_validation :geocode, if: :address_changed?
  validates :user_id, presence: true
  validates :lend_philosophy, length: { maximum: 1000 }
  validates :lend_other_term, length: { maximum: 500 }
  validates :address, presence: true
  enum lend_municipality: { 茅野市: 0, 諏訪郡原村: 1, 諏訪郡富士見町: 2 }
  enum lend_area: { 五畝未満: 0, 五畝〜一反: 1, 一反〜一反五畝: 2, 一反五畝〜二反: 3, 二反〜二反五畝: 4, 二反五畝以上: 5 }
  enum lend_field_type: { 田: 0, 畑: 1, その他: 2 }
  enum immediate_lending: { 可: 0, 不可: 1 }
  enum status: { 受付中: 0, 相談中: 1, 契約済: 2 }
  enum watering: { あり: 0, なし: 1 }
  enum sunlight: { とても良い: 0, 良い: 1, 普通: 2, 悪い: 3, とても悪い: 4 }
  enum agricultural_machine: { 可能: 0, 不可能: 1 }
  enum crop: { セロリ: 0, ブロッコリー: 1, キャベツ: 2, パセリ: 3, その他の作物: 4 }
  enum field_situation: { 生産している: 0, ほとんど使っていない: 1, 何も作っていない: 2 }
  enum lending_period: { 一年未満: 0, 一年〜二年: 1, 二年〜三年: 2, 三年以上: 3, 現時点では未定: 4 }
  enum lending_term: { 無償: 0, 条件付き無償: 1, 有償: 2 }
  validates :lend_municipality,
            inclusion: { in: LendFarmland.lend_municipalities.keys }
  validates :lend_area,
            inclusion: { in: LendFarmland.lend_areas.keys }
  validates :lend_field_type,
            inclusion: { in: LendFarmland.lend_field_types.keys }
  validates :immediate_lending,
            inclusion: { in: LendFarmland.immediate_lendings.keys }
  validates :status,
            inclusion: { in: LendFarmland.statuses.keys }
  validates :watering,
            inclusion: { in: LendFarmland.waterings.keys }
  validates :sunlight,
            inclusion: { in: LendFarmland.sunlights.keys }
  validates :agricultural_machine,
            inclusion: { in: LendFarmland.agricultural_machines.keys }
  validates :crop,
            inclusion: { in: LendFarmland.crops.keys }
  validates :field_situation,
            inclusion: { in: LendFarmland.field_situations.keys }
  validates :lending_period,
            inclusion: { in: LendFarmland.lending_periods.keys }
  validates :lending_term,
            inclusion: { in: LendFarmland.lending_terms.keys }
  validates :farm_image,
    content_type: { in: %w[image/jpeg image/gif image/png],
    message: '有効な画像形式にしてください' },
    size: { less_than: 5.megabytes, message: '5MB未満の画像にしてください' }
  # validate :district_branch

  #private

      # def district_branch
      #   case LendFarmland.lend_municipalities
      #   when 0
      #     validates :lend_chino, inclusion: { in: LendFarmland.lend_chinos.keys }
      #   when 1
      #     validates :lend_hara, inclusion: { in: LendFarmland.lend_haras.keys }
      #   when 2
      #     validates :lend_fujimi, inclusion: { in: LendFarmland.lend_fujimis.keys }
      #   end
      # end
end

