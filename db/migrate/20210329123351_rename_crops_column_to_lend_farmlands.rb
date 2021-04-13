class RenameCropsColumnToLendFarmlands < ActiveRecord::Migration[6.0]
  def change
    rename_column :lend_farmlands, :crops, :crop
  end
end
