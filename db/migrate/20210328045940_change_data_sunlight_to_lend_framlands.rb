class ChangeDataSunlightToLendFramlands < ActiveRecord::Migration[6.0]
  def change
    change_column :lend_farmlands, :sunlight, :float
  end
end
