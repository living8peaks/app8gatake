class RenameLendingTermsColumnToLendFarmlands < ActiveRecord::Migration[6.0]
  def change
    rename_column :lend_farmlands, :lending_terms, :lending_term
  end
end
