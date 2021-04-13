class RenameLendOtherTermsColumnToLendFarmlands < ActiveRecord::Migration[6.0]
  def change
    rename_column :lend_farmlands, :lend_other_terms, :lend_other_term
  end
end
