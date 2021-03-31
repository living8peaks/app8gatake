class LendFarmland < ApplicationRecord
  belongs_to :user
  has_one_attached :farm_image
  default_scope -> { order(created_at: :desc) }
  validates :lend_philosophy, length: { maximum: 1000 }
  validates :lend_other_term, length: { maximum: 500 }
  enum lend_municipality: { 茅野市: 0, 諏訪郡原村: 1, 諏訪郡富士見町: 2 }
  enum lend_chino: {
    茅野市で地区選択: 0,
    上原: 1, 横内: 2, 茅野町: 3, 仲町: 4, 塚原: 5, 本町: 6, 城山: 7,
    高部: 8, 新井（宮川）: 9, 安国寺: 10, 中河原: 11, 茅野: 12, 西茅野: 13, 坂室: 14,
    両久保: 15, 田沢: 16, 丸山: 17, ひばりヶ丘: 18, みどりヶ丘: 19, 西山: 20, 向ヶ丘: 21,
    長峰: 22, 東向ヶ丘: 23, 墨筋内: 24, 中沖: 25, 赤田: 26, 堤久保: 27, 埴原田: 28,
    鋳物師屋: 29, 北大塩: 30, 塩沢: 31, 米沢台: 32, 南大塩: 33, 下菅沢: 34, 福沢: 35,
    下古田: 36, 上古田: 37, 御作田: 38, 塩之目: 39, 上場沢: 40, 広見: 41, 奥蓼科: 42,
    山寺団地: 43, グリーンヒルズ: 44, 山田: 45, 中沢: 46, 田道: 47, 粟沢: 48, 神之原: 49,
    北久保: 50, 上北久保: 51, 子之神: 52, 菊沢: 53, 穴山: 54, 農場（茅野）: 55, 小泉: 56,
    南小泉: 57, 小堂見: 58, 緑: 59, 美濃戸: 60, 大日影: 61, 下槻木: 62, 上槻木: 63,
    小屋場: 64, 中道: 65, 南蓼科台: 66, 若葉台: 67, 大沢: 68, 青柳: 69, 御狩野: 70,
    金沢上: 71, 金沢下: 72, 大池: 73, 木舟: 74, 金沢台: 75, 新金沢: 76, 旭ヶ丘: 77,
    サン・コ－ポラス旭ヶ丘: 78, 上菅沢: 79, 中村: 80, 山口: 81, 松原: 82, 花蒔: 83, 堀: 84,
    新井（湖東）: 85, 金山: 86, 須栗平: 87, 笹原: 88, 白井出: 89, 東平: 90, 柏原: 91,
    湯川: 92, 芹ヶ沢: 93, 糸萱: 94, 鉄山: 95, 白樺湖: 96, 蓼科: 97, 緑の村: 98,
    車山: 99, 蓼科中央高原: 100, 中大塩1区: 101, 中大塩2区: 102, 中大塩3区: 103, 中大塩4区: 104
  }
  enum lend_hara: {
     原村で地区選択: 0,
     大久保: 1, 柏木: 2, 上里: 3, 菖蒲沢: 4, 中新田: 5, 農場（原村）: 6, 払沢: 7,
     原山: 8, 判の木: 9, ペンション: 10, 南原: 11, 室内: 12, やつがね: 13, 八ッ手: 14, 柳沢: 15
  }
  enum lend_fujimi: {
    富士見町で地区選択: 0,
    神戸: 1, 栗生: 2, 大平: 3, 松目: 4, 原の茶屋: 5, 若宮: 6, 木の間: 7,
    花場: 8, 休戸: 9, 横吹: 10, とちの木: 11, 富士見: 12, 南原山: 13, 富原: 14,
    富士見ヶ丘: 15, 塚平: 16, 入笠山: 17, 富ケ丘: 18, 立沢: 19, 乙事: 20, 下蔦木: 21,
    上蔦木: 22, 神代: 23, 烏帽子: 24, 平岡: 25, 机: 26, 先能: 27, 瀬沢: 28,
    釜無: 29, 新田: 30, 富里: 31, 富士見台: 32, 桜ヶ丘: 33, 小六: 34, 高森: 35,
    信濃境: 36, 池袋: 37, 田端: 38, 先達: 39, 葛窪: 40, 境広原: 41
  }
  enum lend_area: { 五畝未満: 0, 五畝〜一反: 1, 一反〜一反五畝: 2, 一反五畝〜二反: 3, 二反〜二反五畝: 4, 二反五畝以上: 5 }
  enum lend_field_type: { 田: 0, 畑: 1, その他: 2 }
  enum immediate_lending: { 可: 0, 不可: 1 }
  enum status: { 受付中: 0, 相談中: 1, 契約済: 2 }
  enum watering: { あり: 0, なし: 1 }
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

  private

      # def district_branch
      #   case lend_farmland.lend_municipality
      #   when 0
      #     validates :lend_chino, inclusion: { in: LendFarmland.lend_chinos.keys }
      #   when 1
      #     validates :lend_hara, inclusion: { in: LendFarmland.lend_haras.keys }
      #   when 2
      #     validates :lend_fujimi, inclusion: { in: LendFarmland.lend_fujimis.keys }
      #   end
      # end
end

