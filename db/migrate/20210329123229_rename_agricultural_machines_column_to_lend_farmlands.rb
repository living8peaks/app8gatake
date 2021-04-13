class RenameAgriculturalMachinesColumnToLendFarmlands < ActiveRecord::Migration[6.0]
  def change
    rename_column :lend_farmlands, :agricultural_machines, :agricultural_machine
  end
end
