class RemoveLendPlaceFromLendFarmlands < ActiveRecord::Migration[6.0]
  def change
    remove_column :lend_farmlands, :lend_place, :string
  end
end
