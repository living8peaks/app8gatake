class AddDetailsToLendFarmlands < ActiveRecord::Migration[6.0]
  def change
    add_column :lend_farmlands, :address, :string
    add_column :lend_farmlands, :latitude, :float
    add_column :lend_farmlands, :longitude, :float
  end
end
