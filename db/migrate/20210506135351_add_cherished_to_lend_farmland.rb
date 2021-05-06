class AddCherishedToLendFarmland < ActiveRecord::Migration[6.0]
  def change
    add_reference :lend_farmlands, :cherished, null: false, foreign_key: { to_table: :users }
  end
end
