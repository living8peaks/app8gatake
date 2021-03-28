class LendFarmland < ApplicationRecord
  belongs_to :user
  validates :lend_philosophy, length: { maximum: 1000 }
  validates :lend_place, presence: true, length: { maximum: 100 }
  validates :lend_other_terms, length: { maximum: 500 }
  enum lend_municipality: { 茅野市: 0, 諏訪郡原村: 1, 諏訪郡富士見町: 2 }
  enum lend_area: { 五畝未満: 0, 五畝〜一反: 1, 一反〜一反五畝: 2, 一反五畝〜二反: 3, 二反〜二反五畝: 4, 二反五畝以上: 5 }
  enum lend_field_type: { 田: 0, 畑: 1, その他: 2 }
  enum immediate_lending: { 可: 0, 不可: 1 }
  enum status: { 受付中: 0, 相談中: 1, 契約済: 2 }
  enum watering: { 有: 0, 無: 1 }
  enum agricultural_machines: { 可: 0, 不可: 1 }
  enum crops: { セロリ: 0, ブロッコリー: 1, キャベツ: 2, パセリ: 3, その他: 4 }
  enum field_situation: { 生産している: 0, ほとんど使っていない: 1, 何も作っていない: 2 }
  enum lending_period: { 一年未満: 0, 一年〜二年: 1, 二年〜三年: 2, 三年以上: 3, その他: 4 }
  enum lending_terms: { 無償: 0, 条件付き: 1, 無償有償: 2 }
  validates :lend_municipality,
            inclusion: { in: LendFarmland.lend_municipalities.keys }
  validates :lend_area,
            inclusion: { in: LendFarmland.lend_area.keys }
  validates :lend_field_type,
            inclusion: { in: LendFarmland.lend_field_type.keys }
  validates :immediate_lending,
            inclusion: { in: LendFarmland.immediate_lending.keys }
  validates :status,
            inclusion: { in: LendFarmland.status.keys }
  validates :watering,
            inclusion: { in: LendFarmland.watering.keys }
  validates :agricultural_machines,
            inclusion: { in: LendFarmland.agricultural_machines.keys }
  validates :crops,
            inclusion: { in: LendFarmland.crops.keys}
  validates :field_situation,
            inclusion: { in: LendFarmland.field_situation.keys }
  validates :lending_period,
            inclusion: { in: LendFarmland.lending_period.keys }
  validates :lending_terms,
            inclusion: { in: LendFarmland.lending_terms.keys }
  case lend_farmaland.lend_municipality
  when 0
    validates :lend_chino, inclusion: { in: LendFarmland.lend_chino.keys }
  when 1
    validates :lend_hara, inclusion: { in: LendFarmland.lend_hara.keys }
  when 2
    validates :lend_fujimi, inclusion: { in: LendFarmland.lend_hara.keys }
  end
end
