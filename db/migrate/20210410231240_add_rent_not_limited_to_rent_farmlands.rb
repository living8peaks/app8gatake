class AddRentNotLimitedToRentFarmlands < ActiveRecord::Migration[6.0]
  def change
    add_column :rent_farmlands, :rent_not_limited, :integer
  end
end
