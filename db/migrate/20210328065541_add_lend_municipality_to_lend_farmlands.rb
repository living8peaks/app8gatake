class AddLendMunicipalityToLendFarmlands < ActiveRecord::Migration[6.0]
  def change
    add_column :lend_farmlands, :lend_municipality, :integer
  end
end
